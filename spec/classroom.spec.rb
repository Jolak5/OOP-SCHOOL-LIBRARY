require_relative '../associations/classroom'
require_relative '../base/student'

describe Classroom do
  let(:classroom) { Classroom.new('class 1') }
  let(:student) { Student.new('Honey', 10) }

  context 'When the classroom class is called' do
    it 'should add new student' do
      allow(classroom).to receive(:add_student) { student }
      classroom.student << classroom.add_student(student)

      expect(classroom.student.length).to be 1
    end
  end
end
