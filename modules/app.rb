require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

class App
  def initialize
    @books = []
    @people = []

    @welcome_message = "
    Please choose an option entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit
    "
  end

  def list_books
    if @books.empty?
      puts 'No book found. Please insert one.'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: #{book.author} "
      end
    end
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

  # create a person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i

    case person_type
    when 1
      add_student
    when 2
      add_teacher
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

    Rental.new(person_id, book_id, rental_date)
  end

  # list people with their rentals
  def list_person_rentals
    print "Person's ID:"
    id = gets.chomp.to_i
    puts 'Rentals: '

    found_person = @people.select { |person| person.id == id }

    if found_person.empty?
      puts "\nNo one with this ID was found."
    elsif found_person[0].rentals.empty?
      puts "\nThis person has no rentals."
    else
      found_person[0].rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  # user choice handler
  def user_choice(number)
    case number
    when 1
      puts list_books
    when 2
      puts list_people
    when 3
      puts create_person
    when 4
      puts create_book
    when 5
      puts create_rental
    when 6
      puts list_person_rentals
    end
  end

  # Run app until the exist option is chosen
  def run
    puts '============= Welcome to the School Library App! =============='
    terminate = false

    until terminate
      puts @welcome_message
      number = gets.chomp.to_i

      if number.between?(1, 6)
        user_choice(number)
      elsif number == 7
        terminate = true
        puts "Thanks for using the app. \nExisting..."

      else
        puts 'Wrong input. Try again.'
      end
    end
  end
end
