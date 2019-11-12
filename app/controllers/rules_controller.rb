class RulesController < ApplicationController
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
end
