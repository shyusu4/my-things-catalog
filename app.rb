require './Game/author'
require './Game/game'
require './MusicAlbum/musicalbum.rb'
require './Genere/genere.rb'

class App
  def initialize
    @games = []
    @authors = []
    @music_albums = []
    @generes = []
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

  def add_music_album
    print 'Is the album on spotify? [y, n]: '
    read_on_spotify = gets.chomp
    on_spotify = true if read_on_spotify == "y"
    on_spotify = false if read_on_spotify == "n"

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
        is = "is "
        is += "not " unless album.on_spotify
        print "the album ", is, "on Spotify, and was published on ", album.published_date, ".\n"
      end
    end
  end

  def list_genres
    if @generes.empty?
      puts 'There are no generes.'
    else
      @generes.each { |genere| print "The genere is ", genere.name, ".\n"}
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
      exit 0
    end
  end

  def start
    loop do
      welcome
      list_options
    end
  end
end
