class LikesController < ApplicationController
  before_action:autenticate_user
  
  def create
    @like = Like.new(
      user_id:@current_user.id,
      post_id:params[:post_id]
    )
    @like.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    @like=Like.find_by id:params[:id]
    @like.destroy
    redirect_to post_url(id: @like.post_id)
  end

end
