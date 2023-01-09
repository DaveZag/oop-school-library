module BookOperation
  # create book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))
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
  
end
