class Genere
  attr_reader :name, :id

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

# For testing run `ruby ./Genere/genere.rb`
genere = Genere.new('comedy')
puts genere.id, genere.name
