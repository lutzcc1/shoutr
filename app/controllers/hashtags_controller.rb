class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    @hashtag_timeline = TimelineComponent.new(hashtag: @hashtag)
  end
end
