require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should validate a product with all fields present' do
      @product = Product.new
      @product.name = "Test Product"
      @product.price_cents = 9999 
      @product.quantity = 99
      @category = Category.new
      @category.name = "Test Category"
      @product.category = @category
      expect(@product).to be_valid
    end
    it 'should fail to validate a product with name not present' do
      @product = Product.new
      @product.name = nil
      @product.price_cents = 9999 
      @product.quantity = 99
      @category = Category.new
      @category.name = "Test Category"
      @product.category = @category
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:name]).to eq ["can't be blank"]
    end
    it 'should fail to validate a product with price not present' do
      @product = Product.new
      @product.name = "Test Product"
      @product.price_cents = nil 
      @product.quantity = 99
      @category = Category.new
      @category.name = "Test Category"
      @product.category = @category
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:price]).to eq ["is not a number", "can't be blank"]
    end
    it 'should fail to validate a product with quantity not present' do
      @product = Product.new
      @product.name = "Test Product"
      @product.price_cents = 9999 
      @product.quantity = nil
      @category = Category.new
      @category.name = "Test Category"
      @product.category = @category
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:quantity]).to eq ["can't be blank"]
    end
    it 'should fail to validate a product with category not present' do
      @product = Product.new
      @product.name = "Test Product"
      @product.price_cents = 9999 
      @product.quantity = 99
      @category = Category.new
      @category.name = "Test Category"
      @product.category = nil
      expect(@product).not_to be_valid
      expect(@product.errors.messages[:category]).to eq ["can't be blank"]
    end
  end
end
