class Rental
  # getters and setters
  attr_reader :person, :book
  attr_accessor :date

  def initialize(person, book, date)
    @person = person
    person.rentals << self

    @book = book
    book.rentals << self

    @date = date
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
