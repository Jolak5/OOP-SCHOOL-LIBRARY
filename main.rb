require_relative './base/app'

class Main
  def initialize
    @app = App.new
  end
  puts "Welcome to School Library\n\n"
  puts "Please choose an option by entering a number!\n"
  def options
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def run
    loop do
      options
      input = gets.chomp
      case input.to_i
      when 1 then @app.list_books
      when 2 then @app.list_people
      when 3 then @app.create_person
      when 4 then @app.create_book
      when 5 then @app.create_rental
      when 6 then @app.list_rentals
      when 7
        puts 'Thank you for using School Library App!'
        return
      end
    end
  end
end

main = Main.new
main.run
