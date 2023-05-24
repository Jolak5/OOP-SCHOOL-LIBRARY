require_relative '../base/person'
require_relative '../decorator/capitalizedecorator'

describe Person do
  before(:each) do
    @person = Person.new(20, 'adam Sandler', parent_permission: true)
    @capitalizedperson = CapitalizeDecorator.new(@person)
  end

  context 'When testing the Capitalized class' do
    it 'the name should return true' do
      expect(@capitalizedperson.correct_name).to eql('Adam sandler')
    end
  end
end
