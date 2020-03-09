class GoalsController < ApplicationController
before_action:autenticate_user,{only:[:record]}
before_action:ensure_current_user,{only:[:edit,:update,:new,:create,:reset,:recreate,:done,:unfinish,:destroy]}

  def new
    @goal=Goal.new
  end

  def create
    @user = User.find_by(id:@current_user.id)
    @user_name = @user.name
    @goal = Goal.new(
     goal:params[:goal],
     purpose:params[:purpose],
     date:params[:date],
     user_id:@current_user.id,
     users_name:@user_name
   )
    if @goal.save
      flash[:notice] = "大目標設定完了です"
      redirect_to new_post_url(@user)
    else
      render action: new
    end
  end

  def edit
    @goal = Goal.find_by(user_id:@current_user.id)
  end

  def reset
    @goal = Goal.new
  end

  def recreate
    @goal = Goal.new(
    goal:params[:goal],
     purpose:params[:purpose],
     date:params[:date],
     user_id:@current_user.id,
     users_name:@current_user.name
    )
    if @goal.save
      flash[:notice] = "目標を再度作成・設定しました"
      redirect_to("/users/#{@current_user.id}")
    else
      render("/goals/reset")
    end
  end

  def update
    @goal = Goal.find_by(user_id: @current_user.id)
    @goal.goal = params[:goal]
    @goal.purpose = params[:purpose]
    @goal.date = params[:date]
    if @goal.save
      flash[:notice] = "目標を更新しました！"
      redirect_to("/users/#{@current_user.id}")
    else
      render("/goals/#{@current_user.id}/edit_goal")
    end
  end

  def done
    @goal=Goal.find_by(id: params[:id])
    @goal.status = "done"

    if @goal.save
      flash[:noice] = "目標を達成しました！おめでとうございます！"
      redirect_to("/goals/#{@goal.id}/record")
    else
      render("users#show")
    end
  end

  def unfinish
     @goal = Goal.find_by(id: params[:id])
     @goal.status = nil

     if @goal.save
      flash[:noice] = "目標達成状態を取り消しました"
      redirect_to("/goals/#{@goal.id}/record")
    else
      render("users#show")
    end 
  end

  def destroy
    @goal = Goal.find_by(id: params[:id])
    @goal.destroy
    redirect_to("/goals/#{@current_user.id}/record")
  end

  def record
    @user = User.find_by(id: @current_user.id)
    @goal= Goal.find_by status:"done",user_id:@current_user.id
  end

end
