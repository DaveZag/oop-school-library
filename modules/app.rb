require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'app_operations'

class App
  include Actions

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
