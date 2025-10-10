class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def home
  end

  def dashboard
    @user = current_user
    @tools = @user.tools
    @available_tools = current_user.available_tools_count
  end

end
