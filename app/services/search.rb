class Search
  attr_reader :term
  def initialize(term:)
    @term = term
  end

  def run
    Shout.joins("LEFT JOIN text_shouts ON content_type = 'TextShout' AND content_id = text_shouts.id").where("text_shouts.body LIKE ?", "%##{term}%")
  end
end