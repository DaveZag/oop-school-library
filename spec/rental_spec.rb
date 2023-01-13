require 'spec_helper'

describe Rental do
  context 'Testing the Rental class after taking 3 arguments' do
    book = Book.new('Time and Space', 'Dave Dost')
    student = Student.new(16, 'Didi Kist', true)

    before :each do
      @rental = Rental.new(student, book, '2023/05/25')
    end

    it 'should properly create a Rental instance' do
      expect(@rental).to be_instance_of Rental
    end

    it 'should should validate the date of the rental' do
      expect(@rental.date).to eq '2023/05/25'
    end

    it 'should should validate the person renting' do
      expect(@rental.person).to eq student
    end

    it 'should should validate the book to rent' do
      expect(@rental.book).to eq book
    end
  end
end
