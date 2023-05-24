require_relative '../base/person'
require_relative '../decorator/trimmerdecorator'

describe Person do
  before(:each) do
    @person = Person.new(20, 'Adam Sandler', parent_permission: true)
    @trimmedperson = TrimmerDecorator.new(@person)
  end

  context 'When testing the Trimmed class' do
    it 'the trimmed name should have a length of 10' do
      expect(@trimmedperson.correct_name.length).to eql 10
    end
  end
end
