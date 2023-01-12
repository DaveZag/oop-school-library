require_relative 'decorators'
require_relative 'rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, id, name = 'unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(self, book, date)
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def of_age?
    @age >= 18
  end

  private :of_age?
end
