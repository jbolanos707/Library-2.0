class Patron
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_patrons = DB.exec("SELECT * FROM patrons;")
    patrons = []
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      id = patron.fetch("id").to_i
      patrons.push(Patron.new(name: name, id: id))
    end
    patrons
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM patrons WHERE id = #{id};")
    name = result.first.fetch("name")
    Patron.new(name: name, id: id)
  end

  define_method(:==) do |other_patron|
    self.name == other_patron.name && self.id == other_patron.id
  end
end
