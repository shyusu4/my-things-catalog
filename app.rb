require './Game/author'
require './Game/game'

class App
  def initialize
    @games = []
    @authors = []
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
