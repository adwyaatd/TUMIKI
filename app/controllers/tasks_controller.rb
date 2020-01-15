class TasksController < ApplicationController
  def index
  	@user = User.find_by(id: params[:id])
    @goal = Goal.find_by(users_id: @current_user.id)
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
  	 redirect_to("/tasks/#{@current_user.id}/new")
    else
     render("tasks#new")
    end
  end

  def edit
  end

  def done
    @task = Task.find_by(id: params[:id])
    @task.status = "done"

    if @task.save
      redirect_to("/tasks/#{@current_user.id}")
    else
      render("tasks#index")
    end
  end

  def unfinish
    @task = Task.find_by(id: params[:id])
    @task.status = nil

    if @task.save
     redirect_to("/tasks/#{@current_user.id}")
    else
      render("tasks#index")
    end 
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to("/tasks/#{@current_user.id}")
  end
end
