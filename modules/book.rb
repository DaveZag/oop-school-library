require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author, id = Random.rand(1..10_000))
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(person, self, date)
  end

  # data Serialization
  def to_json(options = {})
    {
      id: @id,
      title: @title,
      author: @author
    }.to_json(options)
  end
end
