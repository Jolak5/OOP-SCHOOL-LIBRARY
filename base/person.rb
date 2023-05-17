require_relative '../decorator/nameable'
require_relative '../decorator/capitalizedecorator'
require_relative '../decorator/trimmerdecorator'

class Person < Nameable
  attr_reader :id, :name, :age, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || :parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    rental.person = self
    @rentals << rental
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalizedperson = CapitalizeDecorator.new(person)
puts capitalizedperson.correct_name
capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedperson)
puts capitalizedtrimmedperson.correct_name
