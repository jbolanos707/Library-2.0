# require 'spec_helper'
#
# describe Inventory do
#
#   describe '#quantity' do
#     it('returns the quantity available of a book') do
#       test_quantity = Inventory.new(quantity: 1, id: nil)
#       expect(test_quantity.quantity).to eq(1)
#     end
#   end
#
#   describe '.all' do
#     it 'is empty at first' do
#       expect(Inventory.all).to eq([])
#     end
#   end
#
#   describe '#save' do
#     it 'will save the quantity value of a book' do
#       test_quantity = Inventory.new(quantity: 3, id: nil)
#       test_quantity.save
#       expect(Inventory.all).to eq([test_quantity])
#     end
#   end
#
#   describe '#==' do
#     it 'is the same quantity value if the quantity and id are the same' do
#       count = Inventory.new(quantity: 3, id: nil)
#       count2 = Inventory.new(quantity:3, id: nil)
#       expect(count).to eq(count2)
#     end
#   end
# end
