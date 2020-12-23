class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @dashboard_timeline = TimelineComponent.new(current_user.followed_users + [current_user])
  end
end
