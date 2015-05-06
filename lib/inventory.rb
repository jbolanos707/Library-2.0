class Inventory

  attr_reader(:quantity, :id)

  define_method(:initialize) do |attributes|
    @quantity = attributes.fetch(:quantity)
    @id = attributes.fetch(:id)
  end
end
