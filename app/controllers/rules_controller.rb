class RulesController < ApplicationController
  
  before_action:forbid_edit_rules,{only:[:edit,:update,:destroy]}

  def forbid_edit_rules
    @rule = Rule.find_by(id:params[:id])
    if @rule.user_id != @current_user.id
      flash[:notice]="他のアカウントでの編集・操作はできません"
      redirect_to user_url(@rule.user_id)
    end
  end

  def new
    @rule = Rule.where(user_id:@current_user.id)
  end

  def create
  	@rule = Rule.new(
  	  content:params[:content],
  	  user_id: @current_user.id
  	)
  	if @rule.save
  		flash[:notice] = "設定しました"
      redirect_to new_rule_url(@rule.user_id)
    else
      render template: "users/show"
  	end
  end

  def edit
    @rule = Rule.find_by(id:params[:id])
  end

  def update
    @rule = Rule.find_by(id:params[:id])
    @rule.content = params[:content]
    if @rule.save
      redirect_to user_url
    else
      render template: "users/show"
    end
  end
  
  def destroy
    @rule = Rule.find_by(id: params[:id])
    @rule.destroy
    flash[:notice] = "マイルールを削除しました"
    redirect_to new_rule_url
  end
end
