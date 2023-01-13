require 'json'
require_relative '../rental'
require_relative './file_ops'
require_relative '../book'

module RentalOperations
  FILE_PATH = './data_files/rentals.json'.freeze

  # Load all rentals and store them in the rentals instance variable
  def load_rentals
    data = open_file(FILE_PATH) # The returned value is an array
    rentals = []

    data.map do |rental|
      person_id = rental['person']['id']
      book_id = rental['book']['id']
      new_object = Rental.new(get_person(person_id), get_book(book_id), rental['date'])

      rentals.push(new_object)
    end

    rentals
  end

  def get_person(id)
    @people.find { |person| person.id == id }
  end

  def get_book(id)
    @books.find { |book| book.id == id }
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

    @rentals.push(Rental.new(@people[person_id], @books[book_id], rental_date))

    puts "\nRental created successfully."
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
      puts
    end
  end

  # Save rentals if any
  def save_rentals
    return unless @rentals.any? && File.exist?(FILE_PATH)

    rentals_string = JSON.generate(@rentals, max_nesting: false)
    File.write(FILE_PATH, rentals_string)
  end
end
