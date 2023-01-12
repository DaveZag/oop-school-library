class Rental
  # getters and setters
  attr_reader :person, :book, :id
  attr_accessor :date

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date

    person.rentals << self
    book.rentals << self
  end

  # data Serialization
  def to_json(options = {})
    {
      person: @person,
      book: @book,
      date: @date
    }.to_json(options)
  end
end
