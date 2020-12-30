class SearchesController < ApplicationController
  def show
    @search_timeline = TimelineComponent.new(keyword: search_term)
  end

  private

  def search_term
    params[:search][:term]
  end
end
