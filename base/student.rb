require_relative 'person'
require_relative '../associations/classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true, classroom: 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom(classroom)
    classroom.student = self
    @classroom.push(self) unless classroom.student.include?(self)
  end
end
