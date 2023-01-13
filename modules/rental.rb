class Rental
  # getters and setters
  attr_reader :person, :book, :id
  attr_accessor :date

  def initialize(person, book, date)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    # puts person.inspect
    person.rentals << self
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
