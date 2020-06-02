require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should validate a user with matching passwords and full name" do
      @user = User.new
      @user.first_name = "John"
      @user.last_name = "Smith"
      @user.email = "test@email.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to be_valid
    end
    it "should not validate a user with missing first name" do
      @user = User.new
      @user.first_name = nil
      @user.last_name = "Smith"
      @user.email = "test@email.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).not_to be_valid
      expect(@user.errors.messages[:first_name]).to eq ["can't be blank"]
    end
    it "should not validate a user with missing last name" do
      @user = User.new
      @user.first_name = "John"
      @user.last_name = nil
      @user.email = "test@email.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).not_to be_valid
      expect(@user.errors.messages[:last_name]).to eq ["can't be blank"]
    end
    it "should not validate a user with mismatched passwords" do
      @user = User.new
      @user.first_name = "John"
      @user.last_name = "Smith"
      @user.email = "test@email.com"
      @user.password = "password1"
      @user.password_confirmation = "password2"
      expect(@user).not_to be_valid
      expect(@user.errors.messages[:password_confirmation]).to eq ["doesn't match Password"]
    end
    it "should not validate a user with an email already in use, case sensitive" do
      @user1 = User.new
      @user1.first_name = "John"
      @user1.last_name = "Smith"
      @user1.email = "test@email.com"
      @user1.password = "password"
      @user1.password_confirmation = "password"
      @user1.save
      @user2 = User.new
      @user2.first_name = "Jane"
      @user2.last_name = "Smith"
      @user2.email = "test@EMAIL.com"
      @user2.password = "password"
      @user2.password_confirmation = "password"
      @user2.save
      expect(@user2).not_to be_valid
      expect(@user2.errors.messages[:email]).to eq ["has already been taken"]
    end
    it "should not validate a user with too short of a password" do
      @user = User.new
      @user.first_name = "John"
      @user.last_name = "Smith"
      @user.email = "test@email.com"
      @user.password = "1234"
      @user.password_confirmation = "1234"
      expect(@user).not_to be_valid
      expect(@user.errors.messages[:password].first).to include("is too short")
    end
  end
  describe ".authenticate_with_credentials" do
    it 'logs in successfully to a user that exists' do
      @user1 = User.new
      @user1.first_name = "John"
      @user1.last_name = "Smith"
      @user1.email = "test@email.com"
      @user1.password = "password"
      @user1.password_confirmation = "password"
      @user1.save
      @user2 = User.authenticate_with_credentials("test@email.com", "password")
      expect(@user2).to be_valid
    end
    it 'does not login to a user that has the wrong email' do
      @user1 = User.new
      @user1.first_name = "John"
      @user1.last_name = "Smith"
      @user1.email = "test@email.com"
      @user1.password = "password"
      @user1.password_confirmation = "password"
      @user1.save
      @user2 = User.authenticate_with_credentials("test2@email.com", "password")
      expect(@user2).to be_nil
    end
    it 'does not login to a user that has the wrong password' do
      @user1 = User.new
      @user1.first_name = "John"
      @user1.last_name = "Smith"
      @user1.email = "test@email.com"
      @user1.password = "password"
      @user1.password_confirmation = "password"
      @user1.save
      @user2 = User.authenticate_with_credentials("test@email.com", "wrongpassword")
      expect(@user2).to be_nil
    end
    it 'can handle edge cases like extra spaces' do
      @user1 = User.new
      @user1.first_name = "John"
      @user1.last_name = "Smith"
      @user1.email = "test@email.com"
      @user1.password = "password"
      @user1.password_confirmation = "password"
      @user1.save
      @user2 = User.authenticate_with_credentials(" test@email.com ", "password")
      expect(@user2).to be_valid
    end
    it 'can handle edge cases like incorrect case' do
      @user1 = User.new
      @user1.first_name = "John"
      @user1.last_name = "Smith"
      @user1.email = "test@email.com"
      @user1.password = "password"
      @user1.password_confirmation = "password"
      @user1.save
      @user2 = User.authenticate_with_credentials("tEsT@eMaIl.CoM", "password")
      expect(@user2).to be_valid
    end
  end
end
