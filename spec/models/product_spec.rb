require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new({:name => 'Unique'})
    @product = Product.new({:name => 'Unicorn Horn', :price_cents => 1000000, :quantity => 3, :category_id => @category.id})
  end

  describe 'Validations' do
    it 'should save a new product with valid inputs' do
      @product.save
      expect(@product).to be_present
    end

    it 'should provide an invalid name error' do
      @product.name = ""
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should provide an invalid price error' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should provide an invalid quantity error' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should provide an invalid category id error' do
      @product.category_id = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    
  end
end
