module Actions
    
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

  # create book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))
  end

  # create rental
  def create_rental
    puts 'Select a book from the following list by number:'
    list_books
    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number(not ID)'
    list_people
    person_id = gets.chomp.to_i

    print 'Date(YY/MM/DD): '
    rental_date = gets.chomp

    Rental.new(@people[person_id], @books[book_id], rental_date)
  end
end