require 'json'
require_relative '../student'
require_relative '../teacher'
require_relative './file_ops'

module PersonOperations
  FILE_PATH = './data_files/people.json'.freeze

  # List all created people
  def list_people
    if @people.empty?
      puts 'No one was found. Please create a person then try again.'
    else
      @people.each_with_index do |person, index|
        puts "#{index})- [#{person.class}] Name: #{person.name}, ID:#{person.id}, Age:#{person.age}"
      end
    end
    puts
  end

  # load and push data into people's array after creating the corresponding objects either teacher or student
  def load_people
    data = open_file(FILE_PATH) # The returned value is an array
    people = []

    unless data.empty?
      data.map do |person|
        if person['personType'] == 'Teacher'
          people.push(Teacher.new(person['specialization'], person['age'], person['name']))
        else
          people.push(Student.new(person['age'], person['name'], person['parent_permission']))
        end
      end
      return people
    end

    people
  end

  # save people if the file exists and the array is not empty
  def save_people
    return unless @people.any?
    return unless File.exist?(FILE_PATH)

    people_string = JSON.generate(@people, max_nesting: false)

    File.write(FILE_PATH, people_string)
  end

  # create a person(teacher or student)
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i

    case person_type
    when 1
      add_student
    when 2
      add_teacher
    else
      return "\nUnknown input. Try again."
    end

    save_people

    puts "\nPerson created successfully"
  end

  def add_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    has_permission = gets.chomp.upcase

    case has_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      'Unknown input'
    end

    puts "#{age}, #{name}, #{parent_permission}"
    @people.push(Student.new(age, name, parent_permission))
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    @people.push(Teacher.new(specialization, age, name))
  end
end
