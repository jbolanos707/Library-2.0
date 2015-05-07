require 'spec_helper'

describe Patron do

  describe '#name' do
    it 'returns the name of the patron' do
      test_patron = Patron.new(name: "Juan Dela Vega", id: nil)
      expect(test_patron.name).to eq("Juan Dela Vega")
    end
  end

  describe '#id' do
    it 'returns the id of the patron' do
      test_id = Patron.new(name: "Jane", id: 1)
      expect(test_id.id).to eq(1)
    end
  end

  describe '.all' do
    it 'starts with no patrons' do
      expect(Patron.all).to eq([])
    end
  end

  describe '#save' do
    it 'saves the patron to the database' do
      test_patron = Patron.new(name: "Jane", id: 1)
      test_patron.save
      expect(Patron.all).to eq([test_patron])
    end
  end

  describe '.find' do
    it 'returns a patron by its ID' do
      test_patron =  Patron.new(name: "Jane", id: nil)
      test_patron.save
      expect(Patron.find(test_patron.id)).to eq(test_patron)
    end

  end

  describe '#==' do
    it 'is the same patron if the name and id are the same' do
      patron1= Patron.new(name: "Malcolm", id: nil)
      patron2 = Patron.new(name: "Malcolm", id: nil)
      expect(patron1).to eq(patron2)
    end
  end
end
