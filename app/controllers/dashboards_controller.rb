class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @shout = Shout.new
    @shouts = current_user.timeline_shouts
  end
end
