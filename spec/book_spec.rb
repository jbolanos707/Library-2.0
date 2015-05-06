require 'spec_helper'

describe Book do
  describe '#title' do
    it 'returns the title of the book' do
      test_book = Book.new(title: "Harry Potter")
      expect(test_book.title()).to(eq("Harry Potter"))
    end
  end
end
