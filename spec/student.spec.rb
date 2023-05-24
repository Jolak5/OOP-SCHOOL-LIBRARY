require_relative '../base/student'
require_relative '../associations/classroom'

describe Student do
  hooky = '¯(ツ)/¯'
  let(:classroom) { Classroom.new('Class 1') }
  let(:student) { Student.new('Adam Sandler', 15) }

  context 'When testing the student class' do
    it 'should return string when play_hooky is called' do
      expect(student.play_hooky).to eql hooky
    end

    it 'should assign a classroom of name "class 1" to student' do
      allow(student).to receive(:add_classroom) { classroom }
      allow(student).to receive(:classroom) { student.add_classroom }

      expect(student.classroom.label).to eql 'Class 1'
    end
  end
end
