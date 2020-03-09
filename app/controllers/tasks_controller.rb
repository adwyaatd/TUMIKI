class TasksController < ApplicationController

before_action:autenticate_user,{only:[:index]}
before_action:forbid_edit_tasks,{only:[:edit,:update,:done,:unfinish,:destroy]}

  def forbid_edit_tasks
    @task = Task.find_by(id:params[:id])
    if @task.user_id != @current_user.id
      flash[:notice]="他のアカウントでの編集・操作はできません"
      redirect_to user_url(id: @task.user_id)
    end
  end

  def index
  	@user = User.find_by(id: params[:id])
    @goal = Goal.find_by(user_id: @current_user.id)
    @post = Post.new
  end

  def new
  	@task = Task.new
  	@user = User.find_by(id: @current_user.id)
  end

  def create
  	@user = User.find_by(id:@current_user.id)
  	@task = Task.new(
  	  content:params[:content],
  	  user_id:@current_user.id,
  	  user_name:@user.name
  	)
  	if @task.save
  	 redirect_to tasks_url(id: @user.id)
    else
     render action: :new
    end
  end

  def edit
    @task=Task.find_by(id: params[:id])
  end

  def update
    @task=Task.find_by(id:params[:id])
    @task.content= params[:content]
    if @task.save
      flash[:notice]="タスクを編集しました"
      redirect_to tasks_url(id: @user.id)
    else
      render action: :edit
    end
  end

  def done
    @task = Task.find_by(id: params[:id])
    @task.status = "done"

    if @task.save
      redirect_to tasks_url(id: @user.id)
    else
      render action: :index
    end
  end

  def unfinish
    @task = Task.find_by(id: params[:id])
    @task.status = nil

    if @task.save
     redirect_to tasks_url(id: @user.id)
    else
      render action: :index
    end 
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to tasks_url(id: @user.id)
  end
end
