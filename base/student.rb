require_relative 'person'

class Student < Person
  attr_accessor :name, :classroom

  def initialize(age, name = 'Unknown', parent_permission: true, classroom: '')
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
