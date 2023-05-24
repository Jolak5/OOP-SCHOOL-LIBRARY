require_relative '../base/teacher'

describe Teacher do
  let(:teacher) { Teacher.new('King', 30) }
  context 'When the teacher class is called' do
    it 'can_use_services? method should return true' do
      expect(teacher.can_use_services?).to be true
    end
  end
end
