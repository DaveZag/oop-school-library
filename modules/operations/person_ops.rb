module PersonOperation
 # create a person
 def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i

    if person_type == 1
      add_student
    elsif person_type == 2
      add_teacher
    else
        return "\nUnknown input. Try again."
    end

    puts 'Person created successfully'
  end

  def list_people
    if @people.empty?
      puts 'No one was found. Please create a person then try again.'
    else
      @people.each_with_index do |person, index|
        puts "#{index})- [#{person.class}] Name: #{person.name}, ID:#{person.id}, Age:#{person.age}"
      end
    end
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