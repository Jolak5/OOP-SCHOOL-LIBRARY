require_relative '../associations/book'
require_relative '../associations/rental'
require_relative '../base/person'

describe Book do
  before(:each) do
    @book = Book.new('Harry Potter', 'JK Rowlings')
    @person = Person.new(20, 'Adam')
  end

  context 'When testing the book class' do
    it 'the add_rental method should create a rental instance' do
      expect(@book.add_rental(@person, '20-20-2020').class).to be Rental
    end
  end
end
