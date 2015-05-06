require 'spec_helper'

describe Inventory do

  describe '#quantity' do
    it('returns the quantity available of a book') do
      test_quantity = Inventory.new(quantity: 1, id: nil)
      expect(test_quantity.quantity).to eq(1)
    end
  end
end
