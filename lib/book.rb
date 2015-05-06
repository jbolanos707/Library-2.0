class Book
  attr_reader(:title)
  define_method(:initialize) do |info|
    @title = info.fetch(:title)
  end
end
