require_relative '../associations/classroom'
require_relative '../base/student'
require_relative '../base/teacher'
require_relative '../base/person'
require_relative '../associations/book'
require_relative '../associations/rental'
require 'json'
require 'pry'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'There is no book.'
      puts "Please choose an option by entering a number!\n"
      return
    end
    @books.each do |book|
      puts "Title: #{book.title} , Author: #{book.author}"
    end
  end

  def list_people
    if @people.empty?
      puts 'There are no people.'
      puts "Please choose an option by entering a number!\n"
      return
    end
    @people.each do |p|
      puts "[#{p.class}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input = gets.chomp.to_i

    case input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid input, person not created'
      puts "Please choose an option by entering a number!\n"
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]:  '
    gets.chomp.downcase
    @people << Student.new(age, name)
    puts "Student created successfully!\n\n"
    puts "Please choose an option by entering a number!\n"
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization:  '
    gets.chomp
    @people << Teacher.new(age, name)
    puts "Teacher created successfully!\n\n"
    puts "Please choose an option by entering a number!\n"
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    puts "Book created successfuly!\n\n"
    puts "Please choose an option by entering a number!\n"
  end

  def create_rental
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

      person_index = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp

      @rentals << Rental.new(date, @books[book_index], @people[person_index])
      puts "Rental created successfully\n\n"
    end
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }

    if rentals.empty?
      puts 'There are currently no rentals for this person!'
    else
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
      end
    end
    puts "Please choose an option by entering a number!\n"
  end

  def save_files
    unless @people.empty?
      File.open('people.json', 'w') do |file|
        file.puts(
          JSON.dump(
            {
              data: @people.map do |person|
                      { id: person.id,
                        type: person.class,
                        name: person.name,
                        age: person.age }
                    end
            }
          )
        )
      end
    end

    unless @rentals.empty?
      File.open('rentals.json', 'w') do |file|
        file.puts(
          JSON.dump(
            {
              data: @rentals.map do |rental|
                      { date: rental.date,
                        book_title: rental.book.title,
                        author: rental.book.author,
                        borrower_id: rental.person.id }
                    end
            }
          )
        )
      end
    end

    return if @books.empty?

    File.open('books.json', 'w') do |file|
      file.puts(
        JSON.dump(
          {
            data: @books.map do |book|
                    {
                      title: book.title,
                      author: book.author
                    }
                  end
          }
        )
      )
    end
  end

  def load_people_data
    return unless File.exist?('people.json')

    filedata = File.open('people.json', 'r')

    people = JSON.parse(filedata.readline)['data'] unless filedata.eof?

    return if people.nil?

    people.each do |person|
      @people << if person['type'] == 'Student'
                   new_student = Student.new(person['age'], person['name'])
                   new_student.id = person['id']
                   new_student
                 else
                   new_teacher = Teacher.new(person['age'], person['name'])
                   new_teacher.id = person['id']
                   new_teacher
                 end
    end
  end

  def load_books_data
    return unless File.exist?('books.json')

    filedata = File.open('books.json', 'r')

    books = JSON.parse(filedata.readline)['data'] unless filedata.eof?

    return if books.nil?

    books.each do |book|
      @books << Book.new(book['title'], book['author'])
    end
  end

  def load_rentals_data
    return unless File.exist?('rentals.json')

    filedata = File.open('rentals.json', 'r')

    rentals = JSON.parse(filedata.readline)['data'] unless filedata.eof?

    return if rentals.nil?

    rentals.each do |rental|
      # person = @people.find { |element| element.id.to_i == 303 }
      person = @people.find { |p| p.id.to_i == rental['borrower_id'].to_i }

      @rentals << Rental.new(rental['date'], Book.new(rental['book_title'], rental['author']),
                             person)
    end
  end
end

puts @people
