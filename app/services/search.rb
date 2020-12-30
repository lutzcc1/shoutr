class Search
  attr_reader :keyword
  def initialize(keyword)
    @keyword = keyword
  end

  def run
    ShoutSearchQuery.new(term: keyword).to_relation
  end
end