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

  describe '.find' do
    it 'returns a book by its ID number' do
      test_book1 = Book.new(title: "Harry Potter", id: nil)
      test_book1.save
      test_book2 = Book.new(title: "Harry Potter", id: nil)
      test_book2.save
      expect(Book.find(test_book2.id())).to eq(test_book2)
    end
  end

end
