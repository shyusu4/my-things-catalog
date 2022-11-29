require './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at, :published_date

  def initialize(multiplayer, last_played_at, published_date)
    super(published_date, false)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && @last_played_at > 2
  end

  def create_json
    super.merge(
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    )
  end
end
