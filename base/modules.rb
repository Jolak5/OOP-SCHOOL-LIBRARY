require_relative '../base/student'
require_relative '../base/teacher'
require_relative '../base/person'
require_relative '../associations/book'
require_relative '../associations/rental'

module LoadData
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
      person = @people.find { |p| p.id.to_i == rental['borrower_id'].to_i }

      @rentals << Rental.new(rental['date'], Book.new(rental['book_title'], rental['author']),
                             person)
    end
  end
end

module SaveData
  def save_files
    save_people_data
    save_books_data
    save_rentals_data
  end

  def save_people_data
    return if @people.empty?

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

  def save_books_data
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

  def save_rentals_data
    return if @rentals.empty?

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
end
