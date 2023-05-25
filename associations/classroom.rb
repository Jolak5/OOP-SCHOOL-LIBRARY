class Classroom
  attr_accessor :label, :student

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    student.classroom = self
    @student << student
  end
end
