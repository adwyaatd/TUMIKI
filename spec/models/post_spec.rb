require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with content and user_id" do
    post = Post.new(content:"test",user_id:1)
    expect(post).to be_valid
  end
end
