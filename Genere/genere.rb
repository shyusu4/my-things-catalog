class Genere
  attr_reader :name, :id, :items

  def initialize(name)
    @id = Random.rand(100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    items.genre = self
  end
end
