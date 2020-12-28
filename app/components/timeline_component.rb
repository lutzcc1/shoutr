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
      Shout.joins("LEFT JOIN text_shouts ON content_type = 'TextShout' AND content_id = text_shouts.id").where("text_shouts.body LIKE ?", "%##{hashtag}%")
    end
  end
end
