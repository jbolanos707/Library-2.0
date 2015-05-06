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
end
