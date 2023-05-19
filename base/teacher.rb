require_relative 'person'
require_relative '../decorator/nameable'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name = 'Unknown', specialization: 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
