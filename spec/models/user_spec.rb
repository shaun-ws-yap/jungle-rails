require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = User.new({:first_name => 'Shaun', :last_name => 'Yap', :email => 'a@a.com', :password => 'abc123', :password_confirmation => 'abc123'})
  end

  describe 'Validations' do
    it 'should save a valid user account' do
      @user.save
      expect(@user).to be_present
    end

    it 'should be invalid if second password field is missing' do 
      @user.password_confirmation = ""
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should be invalid if second password does not match first password field' do 
      @user.password_confirmation = "abc12"
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'should check for unique emails (case sensitive)' do
      @user.save
      @user2 = User.new({
        :first_name => 'Angry',
        :last_name => 'Pepe',
        :email => 'a@a.com',
        :password => 'peepo456',
        :password_confirmation => 'peepo456'
      })
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should check for unique emails (case insensitive)' do
      @user.save
      @user2 = User.new({
        :first_name => 'Angry',
        :last_name => 'Pepe',
        :email => 'A@A.com',
        :password => 'peepo456',
        :password_confirmation => 'peepo456'
      })
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should check for missing email field' do
      @user.email = nil;
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should check for password minimum length' do
      @user.password = 'abc'
      @user.password_confirmation = 'abc'
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return user object if authenticated' do
      @user.save
      # puts @user.authenticate_with_credentials(@user.email, @user.password)
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
    end

    it 'should return nil if NOT authenticated (wrong email)' do
      @user.save

      expect(User.authenticate_with_credentials('bla@bla.com', @user.password)).to eq(nil)
    end

    it 'should return nil if NOT authenticated (wrong password)' do
      @user.save

      expect(User.authenticate_with_credentials(@user.email, 'abc12')).to eq(nil)
    end
  end
end
