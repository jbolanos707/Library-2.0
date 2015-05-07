class Inventory

  attr_reader(:quantity, :id)

  define_method(:initialize) do |attributes|
    @quantity = attributes.fetch(:quantity).to_i
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_quantities = DB.exec("SELECT * FROM copies;")
    quantities = []
    returned_quantities.each do |count|
      quantity = count.fetch("inventory")
      id = count.fetch("id").to_i
      quantities.push(Inventory.new(quantity: quantity, id: id))
    end
    quantities
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO copies (inventory) VALUES (#{@quantity}) RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  define_method(:==) do |second_count|
    self.quantity == second_count.quantity && self.id == second_count.id
  end
end
