require 'spec_helper'

describe Book do
  describe '#title' do
    it 'returns the title of the book' do
      test_book = Book.new(title: "Harry Potter", id: nil)
      expect(test_book.title()).to(eq("Harry Potter"))
    end
  end

  describe '.all' do
    it 'returns all the books from the database' do
      expect(Book.all).to(eq([]))
    end
  end

  describe '#save' do
    it 'saves the book to the database' do
      test_book = Book.new(title: "Harry Potter", id: nil)
      test_book.save
      expect(Book.all).to eq([test_book])
    end
  end

  describe '#==' do
    it 'is the same book if it has the same name and id' do
      test_book = Book.new(title: "Harry Potter", id: nil)
      test_book2 = Book.new(title: "Harry Potter", id: nil)
      expect(test_book).to(eq(test_book2))
    end
  end

  describe '.find_id' do
    it 'returns a book by its ID number' do
      test_book2 = Book.new(title: "Harry Potter", id: nil)
      test_book2.save
      expect(Book.find_id(test_book2.id())).to eq(test_book2)
    end
  end

  describe '#update' do
    it 'updates the name of a book' do
      test_book1 = Book.new(title: "Harry Potter", id: nil)
      test_book1.save
      test_book1.update(title: "Jane Austen")
      expect(test_book1.title).to(eq("Jane Austen"))
    end

    it 'allows you to add an author to a book' do
      test_book = Book.new(title: "Harry Potter", id: nil)
      test_book.save
      test_author = Author.new(name: "J.K. Rowling", id: nil)
      test_author.save
      test_author.update(author_ids: [test_author.id])
      expect(test_book.authors).to eq(test_author)
  end

  describe '#authors' do
    it 'returns all the authors of a particular book' do
      test_book = Book.new(title: "Harry Potter", id: nil)
      test_book.save
      test_author = Author.new(name: "J.K. Rowling", id: nil)
      test_author.save
      test_author.update(author_ids: [test_author.id])
      expect(test_book.authors).to eq(test_author)
    end
  end

  describe '.delete' do
    it 'deletes a book from the database' do
      test_book1 = Book.new(title: "Harry Potter", id: nil)
      test_book1.save
      test_book2 = Book.new(title: "Hunger Games", id: nil)
      test_book2.save
      test_book1.delete
      expect(Book.all).to eq([test_book2])
    end
  end
end
