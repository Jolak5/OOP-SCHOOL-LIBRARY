require_relative 'person'

class Student < Person
  attr_accessor :name :classroom

  def initialize(age, name = 'Unknown', parent_permission: true, classroom: '')
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
