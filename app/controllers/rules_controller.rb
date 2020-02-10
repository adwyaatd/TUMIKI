class RulesController < ApplicationController
  
  before_action:ensure_current_user,{only:[:new,:create]}
  before_action:forbid_edit_rules,{only:[:edit,:update,:destroy]}

  def forbid_edit_rules
    @rule = Rule.find_by(id:params[:id])
    if @rule.user_id != @current_user.id
      flash[:notice]="他のアカウントでの編集・操作はできません"
      redirect_to("/users/#{@current_user.id}")
    end
  end

  def new
    @rule = Rule.where(user_id:@current_user.id)
  end

  def create
  	@rule = Rule.new(
  	  content:params[:content],
  	  user_id:params[:id]
  	)
  	if @rule.save
  		flash[:notice] = "設定しました"
  		redirect_to("/rules/#{@current_user.id}/new")
  	else
  		render("/rules/new")
  	end
  end

  def update
    @rule = Rule.find_by(id:params[:id])
    @rule.content = params[:content]
    if @rule.save
      redirect_to("/rules/#{@current_user.id}/new")
    else
      render("rules/#{@current_user.id}/new")
    end
  end

  def edit
    @rule = Rule.find_by(id:params[:id])
  end
  
  def destroy
    @rule = Rule.find_by(id: params[:id])
    @rule.destroy
    flash[:notice] = "マイルールを削除しました"
    redirect_to("/rules/#{@current_user.id}/new")
  end
end
