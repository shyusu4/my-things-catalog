module MovieFunctions
  def add_movie(movies)
    puts 'Enter the published date of the movie'
    published_date = gets.chomp.to_s
    puts 'Has movie been silet? [Y/N]'
    silet = gets.chomp
    case silet
    when 'Y'
      silet = true
    when 'N'
      silet = false
    else
      puts 'Invalid input'
    end
    movie = Movie.new(published_date, silet)
    movies << movie
    puts 'Movie created successfully'

    puts 'Enter the name of the source'
    name = gets.chomp.to_s
    source = Source.new(name)
    @sources << source
    puts 'Source created successfully'
  end

  def list_movies(movies)
    movies.each_with_index do |movie, index|
      puts "#{index + 1} - #{movie.published_date} - #{movie.silet}"
    end
  end
end
