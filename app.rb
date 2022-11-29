class App
  def initialize
    @book = []
  end

  def add_book
    puts 'Add publisher:'
    publisher = gets.chomp
    puts 'Add cover state (good or bad):'
    cover_state = gets.chomp
    puts 'Add publish date:'
    published_date = gets.chomp
    book = Book.new(published_date, publisher, cover_state)
    puts 'Book created successfully'
  end

  def add_label(item)
    puts 'Add title:'
    title = gets.chomp
    puts 'Add color:'
    color = gets.chomp
    label = Label.new(title, color)
    label.add_item(item)
    puts 'Label created successfully'
  end

  def list_options
    option = gets.chomp.to_s
    case option
    when '1'
      list_books
    when '2'
      list_labels
    when '3'
      list_music_albums
    when '4'
      list_movies
    when '5'
      list_games
    when '6'
      list_authors
    when '7'
      list_sources
    when '8'
      list_genres
    when '9'
      add_book
    when '10'
      add_music_album
    when '11'
      add_game
    when '12'
      add_movie
    when '13'
      puts 'File saved successfully!'
      puts 'Thank you for using this app!'
      exit
    end
  end
end
