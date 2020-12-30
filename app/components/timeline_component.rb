# frozen_string_literal: true

class TimelineComponent < ViewComponent::Base
  def initialize(users: nil, hashtag: nil)
    @users = users
    @hashtag = hashtag
    @timeline_shouts = timeline_shouts.order(created_at: :desc)
  end

  private

  attr_accessor :users, :hashtag

  def timeline_shouts
    if users && hashtag.nil?
      Shout.where(user: users)
    elsif hashtag && users.nil?
      Search.new(hashtag).run
    end
  end
end
