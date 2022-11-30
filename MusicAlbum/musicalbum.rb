require_relative '../item'

class MusicAlum < Item
  attr_reader :on_spotify

  def initialize(on_spotify, published_date)
    super(published_date, false)
    @on_spotify = on_spotify
  end

  def can_be_archived?()
    super() && @on_spotify
  end
end

## test intance
alb = MusicAlum.new(true, 3)
puts alb.can_be_archived?
