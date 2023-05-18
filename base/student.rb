require_relative 'person'

class Student < Person
  attr_reader :name, :classroom

  def initialize(age, name = 'Unknown', parent_permission: true, classroom: '')
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    classroom.student = self  
    @classroom.push(classroom) unless classroom.student.include?(self)
  end
end
