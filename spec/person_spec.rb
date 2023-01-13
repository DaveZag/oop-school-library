require 'spec_helper'

describe Person do
  context 'Testing the Person class after taking 3 arguments' do
    id = 15
    age = 23
    name = 'Dave Dist'
    person = Person.new age, id, name

    it 'should correctly create a Person instance' do
      expect(person).to be_instance_of Person
    end

    it 'should correctly return the name of a person' do
      expect(person.name).to eq name
    end

    it 'should correctly return the age of the person' do
      expect(person.age).to eq age
    end

    it 'should be able to add a rental to a person' do
      book = Book.new('Time and Space', 'Dave Dost')
      person.add_rental('2023/03/03', book)
      expect(person.rentals.length).to be 1
    end

    it 'should return true for the can_us_services? method' do
      expect(person.can_use_services?).to be true
    end
  end
end
