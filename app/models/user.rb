class User < ApplicationRecord
  has_secure_password

  validates :name,{presence:true,uniqueness:true}
  validates :email,{presence:true, uniqueness:true}


  def posts
    return Post.where(user_id:self.id)
  end

  def goals
    return Goal.where(id:self.id)
  end
end
