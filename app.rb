require_relative './Movies/movie'
require_relative './Movies/movie_method'
require_relative './Source/source'
require_relative './Source/source_method'
require './book-label/book'
require './book-label/label'
require './Author/author'
require './Game/game'
require './MusicAlbum/musicalbum'
require './Genere/genere'
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
    @music_albums = []
    @generes = []
    @game_store = DataStore.new('games')
    @games = @game_store.read.map do |game|
      Game.new(game['multiplayer'], game['last_played_at'], game['published_date'])
    end

    @author_store = DataStore.new('authors')
    @authors = @author_store.read.map do |author|
      Author.new(author['first_name'], author['last_name'])
    end

    @book_store = DataStore.new('books')
    @books = @book_store.read.map do |book|
      Book.new(book['publisher'], book['cover_state'], book['published_date'])
    end

    @label_store = DataStore.new('labels')
    @labels = @label_store.read.map do |label|
      Label.new(label['title'], label['color'])
    end

    @music_album_store = DataStore.new('music_albums')
    @music_albums = @music_album_store.read.map do |album|
      MusicAlbum.new(album['on_spotify'], album['published_date'])
    end

    @genere_store = DataStore.new('generes')
    @generes = @genere_store.read.map do |genere|
      Genere.new(genere['name'], items: genere['items'])
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

  def add_music_album
    print 'Is the album on spotify? [y, n]: '
    read_on_spotify = gets.chomp
    on_spotify = true if read_on_spotify == 'y'
    on_spotify = false if read_on_spotify == 'n'

    print 'When was the game published?'
    published_date = gets.chomp

    @music_albums << MusicAlbum.new(on_spotify, published_date)
    print 'Music album was successfully generated. '

    print 'What is the name of the genere? '
    name = gets.chomp

    @generes << Genere.new(name)
    print 'Music album was successfully generated. '
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'There are no music albums.'
    else
      @music_albums.each do |album|
        is = 'is '
        is += 'not ' unless album.on_spotify
        print 'The album ', is, 'on Spotify, and was published on ', album.published_date, ".\n"
      end
    end
  end

  def list_genres
    if @generes.empty?
      puts 'There are no generes.'
    else
      @generes.each { |genere| print 'The genere is ', genere.name, ".\n" }
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
    @book_store.write(@books.map(&:create_json))
    @label_store.write(@labels.map(&:create_json))
    @music_album_store.write(@music_albums.map(&:create_json))
    @genere_store.write(@generes.map(&:create_json))
  end

  def start
    loop do
      welcome
      list_options
    end
  end
end
