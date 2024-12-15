class UsersController < ApplicationController
  def new
      @events = current_user.created_events
  end
  def profile
    @user = User.find(params[:id])
  end
end
