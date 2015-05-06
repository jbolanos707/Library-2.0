class Book
  attr_reader(:title)
  define_method(:initialize) do |info|
    @title = info.fetch(:title)
  end

  define_singleton_method(:all) do
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each() do |book|
      title = book.fetch("title")
      id = book.fetch("id").to_i()
      books.push(Book.new(title: title, id: id))
    end
    books
  end

end
