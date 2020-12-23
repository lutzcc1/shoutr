class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
    @user_timeline = TimelineComponent.new(@user)
  end
end
