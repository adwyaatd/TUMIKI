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

  def new
  	@task = Task.new
  	@user = User.find_by(id: @current_user.id)
  end

  def create
  	@task = Task.new task_params
  	if @task.save
  	 redirect_to tasks_user_url(id: @current_user.id)
    else
     render action: :new
    end
  end

  def edit
    @task=Task.find_by(id: params[:id])
  end

  def update
    @task=Task.find_by(id:params[:id])
    @task.update(task_params)
    if @task.save
      flash[:notice]="タスクを編集しました"
      redirect_to tasks_user_url(id: @task.user_id)
    else
      render :edit
    end
  end

  def done
    @task = Task.find_by(id: params[:id])
    @task.status = "done"

    if @task.save
      redirect_to tasks_user_url(id: @task.user_id)
    else
      render action: :index
    end
  end

  def unfinish
    @task = Task.find_by(id: params[:id])
    @task.status = nil

    if @task.save
     redirect_to tasks_user_url(id: @task.user_id)
    else
      render action: :index
    end 
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to tasks_user_url(id: @task.user_id)
  end

  private
  def task_params
    params.require(:task).permit(:content,:user_id,:user_name)
  end
end
