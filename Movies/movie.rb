require_relative '../item'

class Movie < Item
  attr_reader :silet
  def initialize(published_date, silet)
    super(published_date, false)
    @silet = silet
  end

  def can_be_archived?
    true if can_be_archived? || @silet == true
  end
end
