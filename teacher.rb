require_relative 'person'


class Teacher < Person
    attr_reader :specialization
  def initialize(name= 'Unknown', age, specialization: '')
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
# person = Teacher.new("kayode", 17)
# puts person.name