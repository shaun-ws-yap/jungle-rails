# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

Users can:
  - View all products without logging in
  - Login and signup new accounts
  - Add to and delete from cart and checkout with Stripe
  - Click on a product link to get more information
  - Filter their browsing by category
  - View the "About Us" page

Admins can:
  - Login to the Admin Dashboard
  - Add and delete Products
  - Add Categories
  - View all Products and Categories

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots

### Homepage
!["Screenshot of homepage"](https://github.com/shaun-ws-yap/jungle-rails/blob/master/docs/screenshots/home-page.png?raw=true)

### Cart
!["Screenshot of cart page"](https://github.com/shaun-ws-yap/jungle-rails/blob/master/docs/screenshots/cart-page.png?raw=true)

### Login
!["Screenshot of login page"](https://github.com/shaun-ws-yap/jungle-rails/blob/master/docs/screenshots/login-page.png?raw=true)

### Signup
!["Screenshot of signup page"](https://github.com/shaun-ws-yap/jungle-rails/blob/master/docs/screenshots/signup-page.png?raw=true)

### Stripe Payment Integration
!["Screenshot of stripe payment method"](https://github.com/shaun-ws-yap/jungle-rails/blob/master/docs/screenshots/stripe-payment-integration.png?raw=true)

### Admin Main Dashboard
!["Screenshot of admin main dashboard"](https://github.com/shaun-ws-yap/jungle-rails/blob/master/docs/screenshots/admin-dashboard-page.png?raw=true)

### Admin Products Dashboard
!["Screenshot of admin products dashboard"](https://github.com/shaun-ws-yap/jungle-rails/blob/master/docs/screenshots/admin-products-page.png?raw=true)