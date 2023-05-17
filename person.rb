require_relative 'nameable'
require_relative 'capitalizedecorator'
require_relative 'trimmerdecorator'

class Person < Nameable
  attr_reader :id, :name, :age

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

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(18, 'kayodea Olatunji')
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
trimmed = TrimmerDecorator.new(person)
puts trimmed.correct_name
