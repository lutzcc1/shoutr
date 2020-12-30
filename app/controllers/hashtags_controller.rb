class HashtagsController < ApplicationController
  def show
    @hashtag = hashtag
    @hashtag_timeline = TimelineComponent.new(hashtag: @hashtag)
  end

  private

  def hashtag
    "##{params[:id]}"
  end
end
