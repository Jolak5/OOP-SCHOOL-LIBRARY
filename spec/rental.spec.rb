require_relative '../associations/book'
require_relative '../base/person'

describe Rental do
  let(:book) { Book.new('Harry Potter', 'JK Rowlings') }
  let(:person) { Person.new(20, 'King') }
  let(:rental) { Rental.new('12-12-2021', book, person) }

  context 'When rental class is called' do
    it 'should create a rental' do
      rental = Rental.new('12-12-2021', book, person)

      expect(rental.class).to be Rental
    end
    it 'should create rental with date "12-12-2021"' do
      expect(rental.date).to eql '12-12-2021'
    end
  end
end
