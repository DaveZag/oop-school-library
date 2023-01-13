require 'spec_helper'
​
describe Book do
  context 'Testing the Book class after taking two arguments' do
    title = 'Time and Space'
    author = 'Dave Dost'
    book = Book.new title, author
​
    it 'should correctly create a Book instance' do
      expect(book).to be_instance_of Book
    end
​
    it 'should correctly return the title of the book' do
      expect(book.title).to eq title
    end
​
    it 'should correctly return the author of the book' do
      expect(book.author).to eq author
    end
​
    it 'should be able to add a rental' do
      student = Student.new(16, 'Didi Kist', true)
      book.add_rental('2023/03/03', student)
​
      expect(book.rentals.length).to be 1
    end
  end
end