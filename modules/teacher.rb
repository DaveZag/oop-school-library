require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name = 'unknown', id = Random.rand(1..1000))
    super(age, id, name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  # data Serialization
  def to_json(options = {})
    {
      personType: self.class.name,
      id: @id,
      name: @name,
      age: @age,
      specialization: @specialization
    }.to_json(options)
  end
end
