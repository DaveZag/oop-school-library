require 'json'
require_relative '../book'
require_relative './file_ops'

module BookOperations
  FILE_PATH = './data_files/books.json'
    # open books.json file and display all its data
  def list_books
    if @books.empty?
      puts 'No book found. Please insert one.'
    else
      @books.each_with_index {|book, index|  puts "#{index}) Title: \"#{book.title}\", Author: #{book.author} "}
      puts
    end
  end
  
  # create book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    
    @books.push(Book.new(title, author))  
    save_books
 
    puts "\nBook created successfully."
  end
  def load_books
    data = open_file(FILE_PATH)  # The return value here is an array 
    books = []
    if !data.empty?
      data.map do |book|
        books.push(Book.new(book['title'], book['author']))
      end
    end
    books
  end
    # save books if the file exists and the array is not empty
  def save_books
    return unless @books.any? && File.exist?(FILE_PATH)
    books_string = JSON.generate(@books, max_nesting: false)
    puts "The book to be saved #{@books} and the generated string is: #{books_string}"
    File.write(FILE_PATH, books_string)
  end
end