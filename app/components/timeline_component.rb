# frozen_string_literal: true

class TimelineComponent < ViewComponent::Base
  def initialize(users: nil, keyword: nil)
    @users = users
    @keyword = keyword
    @timeline_shouts = timeline_shouts.order(created_at: :desc)
  end

  private

  attr_accessor :users, :keyword

  def timeline_shouts
    if users && keyword.nil?
      Shout.where(user: users)
    elsif keyword && users.nil?
      Search.new(keyword).run
    end
  end
end
