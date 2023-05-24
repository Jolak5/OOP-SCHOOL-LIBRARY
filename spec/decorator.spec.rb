require_relative '../decorator/nameable'
require_relative '../base/person'

describe Person do
  before(:each) do
    @person = Person.new(20, 'Adam Sandler', parent_permission: true)
    @decorator = Decorator.new(@person)
  end

  context 'When testing the decorator class' do
    it 'the decorator name should have a capitalized first letter' do
      expect(@decorator.correct_name).to eql('Adam Sandler')
    end
  end
end
