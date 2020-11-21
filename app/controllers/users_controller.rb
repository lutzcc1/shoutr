class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
    @shouts = @user.shouts
  end
end
