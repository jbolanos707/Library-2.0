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
end
