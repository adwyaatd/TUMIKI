class User < ApplicationRecord
  has_secure_password

  validates :name,{presence:true,uniqueness:true}
  validates :email,
   presence:true,
   uniqueness:true,
   format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\Z/}

# 　scope :descend -> { order("posts.created_at DESC")}

  def posts
    return Post.where(user_id:self.id).order(created_at: :desc)
  end

  def tasks
    return Task.where(user_id:self.id).order(created_at: :desc)
 end 

  def likes_count
  	return Like.where(post_id:self.id).count
  end
end
