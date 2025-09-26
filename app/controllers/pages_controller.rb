class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def home
  end

  def dashboard
    @user = current_user
    @tools = @user.tools
  end

end
