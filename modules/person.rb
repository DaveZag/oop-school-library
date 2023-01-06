require_relative 'decorators'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  # Public methods

  def can_use_services?
    of_age? || parent_permission
  end
end
