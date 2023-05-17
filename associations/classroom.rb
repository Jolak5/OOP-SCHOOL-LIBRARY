class Classroom
    attr_accessor :label :student
    attr_reader :student
    def initialize(label)
        @label = label
        @student = []
    end

    def add_student(student)
        student.classroom = self
        @students << student
      end
end