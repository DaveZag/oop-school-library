require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
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
