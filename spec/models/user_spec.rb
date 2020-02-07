require 'rails_helper'

RSpec.describe User, type: :model do
  it "isn`t less than 1 character" do
    user = User.new
    expect(user).not_to be_valid
  end

  it "is valid with name,email and password" do
    user = User.new(name: "test",email:"test@gmail.com",password: "test")
    expect(user).to be_valid
  end
  
  it "is invalid without name" do
    user = User.new(name: nil)
    expect(user.valid?).to eq(false)
  end

  it "is invalid without email" do
    user =User.new(email: nil)
    expect(user.valid?).to eq(false)
  end

  it "is invalid without password" do
    user =User.new(password: nil)
    expect(user.valid?).to eq(false)
  end
end