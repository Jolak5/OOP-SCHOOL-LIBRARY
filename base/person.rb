require_relative '../decorator/nameable'
require_relative '../decorator/capitalizedecorator'
require_relative '../decorator/trimmerdecorator'
require_relative '../associations/rental'

class Person < Nameable
  attr_accessor :age, :name, :rentals, :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end

# student = Person.new(2, "kayode")
# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# capitalizedperson = CapitalizeDecorator.new(person)
# puts capitalizedperson.correct_name
# capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedperson)
# puts capitalizedtrimmedperson.correct_name
