class Classroom
  attr_reader :label, :student

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    student.classroom = self
    @students << student
  end
end
