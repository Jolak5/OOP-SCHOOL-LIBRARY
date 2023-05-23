require_relative './base/app'
require_relative 'options'

class Main < Options
  def initialize
    super()
    @app = App.new
  end

  puts "Welcome to School Library\n\n"
  puts "Please choose an option by entering a number!\n"

  def run
    @app.load_books_data
    @app.load_people_data
    @app.load_rentals_data
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
        @app.save_files
        return
      end
    end
  end
end

main = Main.new
main.run
