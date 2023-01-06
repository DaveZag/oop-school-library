class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date

    person.rentals << self
    book.rentals << self
  end
end
