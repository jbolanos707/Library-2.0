require 'spec_helper'

describe Patron do

  describe '#name' do
    it 'returns the name of the patron' do
      test_patron = Patron.new(name: "Juan Dela Vega", id: nil)
      expect(test_patron.name).to eq("Juan Dela Vega")
    end
  end
  
end
