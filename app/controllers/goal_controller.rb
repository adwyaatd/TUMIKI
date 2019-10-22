class GoalController < ApplicationController
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
     user_name:@user_name
   )
    if @goal.save
      flash[:notice] = "大目標設定完了です"
      redirect_to("/posts/new")
    else
      render("/goal/#{@current_user.id}/set_goal")
    end
  end
end
