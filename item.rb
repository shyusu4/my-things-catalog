class Item
  attr_accessor :published_date
  attr_reader :id, :genre, :author, :source, :label, :archived

  def initialize(published_date, archived)
    @id = Random.rand(100)
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    @published_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def author=(author)
    @author = author
    @author.items << self
  end

  def source=(source)
    @source = source
    @source.items << self
  end

  def label=(label)
    @label = label
    @label.items << self
  end

  def genre=(genre)
    @genre = genre
    @genre.items << self
  end

  def create_json
    {
      id: @id,
      published_date: @published_date,
      archived: @archived
    }
  end
end

