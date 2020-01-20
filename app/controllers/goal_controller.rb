class GoalController < ApplicationController
before_action:ensure_current_user,{only:[:edit_goal,:update]}

 def ensure_current_user
    if @current_user.id != params[:id].to_i
      flash[:notice]="他のアカウントの編集はできません"
      redirect_to("/users/#{@current_user.id}")
    end
  end

  def set_goal
    @goal=Goal.new
  end

  def create_goal
    @user = User.find_by(id:@current_user.id)
    @user_name = @user.name
    @goal = Goal.new(
     goal:params[:goal],
     purpose:params[:purpose],
     date:params[:date],
     users_id:@current_user.id,
     users_name:@user_name
   )
    if @goal.save
      flash[:notice] = "大目標設定完了です"
      redirect_to("/posts/new")
    else
      render("/goal/#{@current_user.id}/set_goal")
    end
  end

  def edit_goal
    @goal = Goal.find_by(users_id:@current_user.id)
  end

  def update
    @goal = Goal.find_by(users_id: @current_user.id)
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

end
