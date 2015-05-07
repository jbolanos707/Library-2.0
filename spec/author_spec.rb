require 'spec_helper'

describe Author do
  describe '#name' do
    it 'returns the name of the author' do
      test_author = Author.new(name: "J.K. Rowling", id: nil)
      expect(test_author.name).to eq("J.K. Rowling")
    end
  end

  describe '#id' do
    it 'returns the id of the author' do
      test_author = Author.new(name: "J.K Rowling", id: 1)
      expect(test_author.id).to(eq(1))
    end
  end

  describe '.all' do
    it 'starts off with no Author objects' do
      expect(Author.all).to eq([])
    end
  end

  describe '#save' do
    it 'stores the author info into the database' do
      test_author = Author.new(name: "J.K Rowling", id: nil)
      test_author.save
      expect(Author.all).to eq([test_author])
    end
  end

  describe '#==' do
    it 'is the same author if the name and id are the same' do
      test_author = Author.new(name: "J.K Rowling", id: nil)
      test_author1 = Author.new(name: "J.K Rowling", id: nil)
      expect(test_author).to eq(test_author1)
    end
  end

  describe '.find' do
    it 'returns an author by its ID' do
      test_author = Author.new(name: "J.K Rowling", id: nil)
      test_author.save
      test_author2 = Author.new(name: "Dr. Seuss", id: nil)
      test_author2.save
      expect(Author.find(test_author2.id)).to eq(test_author2)
    end
  end

  describe '#update' do
    it 'lets you update the authors in the database' do
      test_author = Author.new(name: "J.K Rowling", id: nil)
      test_author.save
      test_author.update(name: "Dr. Seuss")
      expect(test_author.name).to eq("Dr. Seuss")
    end
  end

end
