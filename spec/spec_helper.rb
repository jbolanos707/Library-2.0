require('rspec')
require('pg')
require('book')
require('patron')
require('pry')
require('author')
require('inventory')


DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM patrons *;")
    DB.exec("DELETE FROM authors *;")
    DB.exec("DELETE FROM copies *;")


  end
end
