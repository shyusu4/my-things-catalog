require_relative './app'

def welcome
  puts 'Welcome to My Things Catalog'
  puts 'Please choose an option by entering a number:'

  puts '1. List all books'
  puts '2. List all labels'
  puts '3. List all music albums'
  puts '4. List all movies'
  puts '5. List of games'
  puts '6. List all authors'
  puts '7. List all sources'
  puts '8. List all genres'
  puts '9. Add a book'
  puts '10. Add a music album'
  puts '11. Add a game'
  puts '12. Add a movie'
  puts '13. Exit'
end

def main
  welcome
  app = App.new
  app.start
end

main
