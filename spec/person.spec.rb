require_relative '../base/person'
require_relative '../associations/rental'
require_relative '../associations/book'

describe Person do
  before(:each) do
    @person = Person.new(20, 'Adam Sandler', parent_permission: true)
  end

  context 'When testing the Person class' do
    it 'the can_use_service? method should return true' do
      expect(@person.can_use_services?).to be true
    end

    it 'should display person name correctly' do
      expect(@person.correct_name).to eql 'Adam Sandler'
    end

    it 'should add person rental' do
      @person.add_rental('12-12-2020', Book.new('Harry Potter', 'JK Rowlings'))
      expect(@person.rentals.length).to eql 1
    end

    it 'the person should be of age' do
      expect(@person.send(:of_age?)).to be true
    end
  end
end
