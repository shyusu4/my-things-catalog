class Genere
  attr_reader :name, :id, :items

  def initialize(name, items: [])
    @id = Random.rand(100)
    @name = name
    @items = items
  end

  def add_item(item)
    @items << item
    items.genre = self
  end

  def create_json
    {
      name: @name,
      items: @items
    }
  end
end
