require './book-label/book'
require './book-label/label'
require './Author/author'
require './Game/game'
require './item'
require './data_store'

class App
  attr_accessor :games, :authors, :items

  def initialize
    @book = []
    @label = []
    @games = []
    @authors = []
    
    @game_store = DataStore.new('games')
    @games = @game_store.read.map do |game|
      Game.new(game['multiplayer'], game['last_played_at'], game['published_date'])
    end

    @author_store = DataStore.new('authors')
    @authors = @author_store.read.map do |author|
      Author.new(author['first_name'], author['last_name'])
    end
  end

  def add_book
    puts 'Add publisher:'
    publisher = gets.chomp
    puts 'Add cover state (good or bad):'
    cover_state = gets.chomp
    puts 'Add publish date:'
    published_date = gets.chomp
    book = Book.new(published_date, publisher, cover_state)
    add_label(book)
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
  
  def add_author
    puts 'Enter first name:'
    first_name = gets.chomp
    puts 'Enter last name:'
    last_name = gets.chomp
    @authors = Author.new(first_name, last_name)
  end

  def add_game
    print 'Does the game have multiplayer? '
    multiplayer = gets.chomp.to_s
    print 'When was the last time you played the game? '
    last_played_at = gets.chomp.to_s
    print 'When was the game published? '
    published_date = gets.chomp.to_s
    @games << Game.new(multiplayer, last_played_at, published_date)
    puts 'Game added successfully!'

    print 'Frist name of the author of the game? '
    first_name = gets.chomp.to_s

    print 'Last name of the author of the game? '
    last_name = gets.chomp.to_s

    @authors << Author.new(first_name, last_name)
    puts 'Author added successfully!'
  end

  def list_games
    if @games.empty?
      puts 'There are no games in the catalog'
    else
      @games.each do |game|
        puts "Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}, Published date: #{game.published_date}"
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'There are no authors in the catalog'
    else
      @authors.each do |author|
        puts "First name: #{author.first_name}, Last name: #{author.last_name}"
      end
    end
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
      close
      exit 0
    end
  end

  def close
    @game_store.write(@games.map(&:create_json))
    @author_store.write(@authors.map(&:create_json))
  end

  def start
    loop do
      welcome
      list_options
    end
  end
end
