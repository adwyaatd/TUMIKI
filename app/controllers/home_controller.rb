class HomeController < ApplicationController
  before_action:forbid_login_user,{only:[:top,:about]}

  def top
  	@user = User.new
  end

  def about
  	@user = User.new
  end
end
