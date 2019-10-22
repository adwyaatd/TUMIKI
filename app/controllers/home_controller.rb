class HomeController < ApplicationController
  before_action:forbid_login_user,{only:[:top,:about]}

  def top
  end

  def about
  end
end
