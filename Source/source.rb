require_relative '../item'

class Source
  attr_accessor :name, :items, :id

  def initialize(name)
    @id = Random.rand(1.9999)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end

  def create_json
    {
     id: @id,
     name: @name
    } 
  end
end
