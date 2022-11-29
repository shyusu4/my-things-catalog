require_relative './item'

class Source
    attr_accessor :name, :items
    def initialize(name, items: [])
        @id = Random.rand(1.9999)
        @name = name
        @items = items
    end
    def add_item(item)
        @items << item
        item.source = self
    end
end