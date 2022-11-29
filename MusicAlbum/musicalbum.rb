require_relative '../item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify, published_date)
    super(published_date, false)
    @on_spotify = on_spotify
  end

  def can_be_archived?()
    super() && @on_spotify
  end
end
