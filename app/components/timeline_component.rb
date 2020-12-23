# frozen_string_literal: true

class TimelineComponent < ViewComponent::Base
  def initialize(users)
    @users = users
    @timeline_shouts = timeline_shouts
  end

  private

  attr_accessor :users

  def timeline_shouts
    Shout.where(user: users).order(created_at: :desc)
  end
end
