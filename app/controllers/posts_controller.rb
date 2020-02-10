class PostsController < ApplicationController
  before_action:autenticate_user,{only:[:index,:show]}
  before_action:ensure_current_user,{only:[:new,:create]}
  before_action:forbid_edit_posts,{only:[:edit,:update,:destroy]}

  def forbid_edit_posts
    @post = Post.find_by(id:params[:id])
    if @post.user_id != @current_user.id
      flash[:notice]="他のアカウントでの編集・操作はできません"
      redirect_to("/users/#{@current_user.id}")
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @like_count=Like.where(post_id:@post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post =Post.new(
      content: params[:content],
      user_id: @current_user.id
    )
    if @post.save
      flash[:notice] = "投稿しました"
       redirect_to("/users/#{@current_user.id}")
    else
       render("posts/new")
     end
  end

  def edit
    @post =Post.find_by(id: params[:id])
  end

  def update
   @post = Post.find_by(id: params[:id])
   @post.content = params[:content]
   if @post.save
     flash[:notice] = "投稿を編集しました"
     redirect_to("/posts/index")
   else
     render("posts/edit")
   end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
end
