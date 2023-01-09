require_relative 'rental'

module RentalOperations
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
end
