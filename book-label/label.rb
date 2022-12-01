class Label
  attr_reader :id, :items, :title, :color

  def initialize(title, color)
    @id = Random.rand(1000)
    @items = []
    @title = title
    @color = color
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def create_json
    {
      id: @id,
      title: @title,
      color: @color
    }
  end
end
