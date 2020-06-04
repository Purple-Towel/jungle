# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


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

## Screenshots and features:

Home Page
!["Home Page"](https://github.com/Purple-Towel/jungle/blob/master/docs/home_page.png)

Product
!["Product"](https://github.com/Purple-Towel/jungle/blob/master/docs/product.png)

Add Product
!["Add Product"](https://github.com/Purple-Towel/jungle/blob/master/docs/add_product.png)
!["New Product"](https://github.com/Purple-Towel/jungle/blob/master/docs/new_product.png)
!["Sold Out Product"](https://github.com/Purple-Towel/jungle/blob/master/docs/sold_out.png)

Logged In
!["Logged In"](https://github.com/Purple-Towel/jungle/blob/master/docs/logged_in.png)

Cart
!["Nav Cart with items"](https://github.com/Purple-Towel/jungle/blob/master/docs/cart.png)
!["Cart Page with items"](https://github.com/Purple-Towel/jungle/blob/master/docs/cart_details.png)
!["Cart Page without items"](https://github.com/Purple-Towel/jungle/blob/master/docs/cart_empty.png)
!["Paying"](https://github.com/Purple-Towel/jungle/blob/master/docs/pay.png)
!["Order Confirmed"](https://github.com/Purple-Towel/jungle/blob/master/docs/order_confirmed.png)

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
