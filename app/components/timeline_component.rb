# frozen_string_literal: true

class TimelineComponent < ViewComponent::Base
  def initialize(users: nil, hashtag: nil)
    @users = users
    @hashtag = hashtag
    @timeline_shouts = timeline_shouts
  end

  private

  attr_accessor :users, :hashtag

  def timeline_shouts
    if users && hashtag.nil?
      Shout.where(user: users).order(created_at: :desc)
    elsif hashtag && users.nil?
      Search.new(term: hashtag).run
    end
  end
end
