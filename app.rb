require_relative './Movies/movie'
require_relative './Movies/movie_method'
require_relative './Source/source'
require_relative './Source/source_method'
require './book-label/book'
require './book-label/label'
require './Author/author'
require './Game/game'
require './item'
require './data_store'
class App
  include MovieFunctions
  include SourcesFunctions
  attr_accessor :games, :authors, :books, :labels, :items

  def initialize
    @movies = []
    @sources = []
    @books = []
    @labels = []
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
    puts 'Publisher:'
    publisher = gets.chomp.to_s
    puts 'Cover state (good/bad):'
    cover_state = gets.chomp.to_s
    puts 'Publish date [Enter date in format (yyyy-mm-dd)]:'
    published_date = gets.chomp.to_s
    book = Book.new(published_date, publisher, cover_state)
    @books << book
    add_label(book)
    puts 'Book created successfully'
  end

  def add_label
    puts 'Title:'
    title = gets.chomp
    puts 'Color:'
    color = gets.chomp
    @labels << Label.new(title, color)
    ## label.add_item(item)
    puts 'Label created successfully'
  end

  def list_labels
    if @labels.empty?
      puts 'There are no labels in the catalog'
    else
      @labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def list_books
    if @books.empty?
      puts 'There are no books in the catalog'
    else
      @books.each do |book|
        puts "Pulblisher: #{book.publisher}, Cover state: #{book.cover_state}, Published date: #{book.published_date}"
      end
    end
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
      list_movies(@movies)
    when '5'
      list_games
    when '6'
      list_authors
    when '7'
      list_sources(@sources)
    when '8'
      list_genres
    when '9'
      add_book
    when '10'
      add_music_album
    when '11'
      add_game
    when '12'
      add_movie(@movies)
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
