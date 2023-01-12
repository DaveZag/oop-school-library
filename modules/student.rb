require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission, id = Random.rand(1..1000))
    super(age, id, name, parent_permission: parent_permission)
    @classroom = nil
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  # data Serialization
  def to_json(options = {})
    {
      personType: self.class.name,
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }.to_json(options)
  end
end
