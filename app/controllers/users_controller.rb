class UsersController < ApplicationController

before_action:autenticate_user,{only:[:index,:show,:likes,:posts_create,:goals]}
before_action:forbid_login_user,{only:[:new,:create,:login,:login_form]}
before_action:ensure_current_user,{only:[:edit,:update]}

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @post = Post.new
  end

  def posts_create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
    )

    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to user_url(@current_user)
    else
      @user = User.find_by(id: @current_user.id)
      render("/users/show")
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      # name: params[:name],
      # email: params[:email],
      # password: params[:password],
    @user.image_name ="default_user.JPG"
    if @user.save
     session[:user_id] = @user.id
     flash[:notice] = "ユーザー登録完了です"
     redirect_to new_goal_url
   else
     @name = params[:name]
     @email = params[:email]
     render :new
   end
  end


  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    if params[:image_name]
      @user.image_name= "#{@user.id}.JPG"
      image = params[:image_name]
      File.binwrite("/Users/hosodaraimu/TUMIKI_app//public/user_images/#{@user.image_name}",image.read)
    end
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to user_url
    else
      render :edit
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      flash[:notice] = "ログインしました"
      redirect_to @user
    else
      @error_message = "メールアドレス又はパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to root_url
  end

  def likes
    @post = Post.find_by(id:params[:id])
    @user=User.find_by(id:params[:id])
    @like=Like.where(user_id:@user.id)
  end

  def goals
    @user=User.find_by(id:params[:id])
    @like=Like.where(user_id:@user.id)
  end

  def tasks
  	@user = User.find_by(id: params[:id])
    @post = Post.new
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end
end
