require_relative './operations/books_ops'
require_relative './operations/person_ops'
require_relative './operations/rentals_ops'

class App
  include BookOperations
  include RentalOperations
  include PersonOperations

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
