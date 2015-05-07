require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/book'
require './lib/author'
require './lib/patron'
require './lib/inventory'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => "library"})

get '/' do
  @authors = Author.all
  @books = Book.all
  erb(:index)
end

get '/books' do
  @books = Book.all
  erb(:books)
end

get '/authors' do
  @authors = Author.all
  erb(:authors)
end

post '/authors' do
  name = params.fetch("name")
  author = Author.new(name: name, id: nil)
  author.save
  @authors = Author.all
  erb(:authors)
end


get '/librarian' do
  @authors = Author.all
  @books = Book.all
  erb(:librarian)
end

post '/librarian' do
  title = params.fetch("title")
  book = Book.new(title: title, id: nil)
  book.save
  @books = Book.all
  erb(:librarian)
end

get '/librarian/:id' do
  @book = Book.find_id(params.fetch("id"))
  @title = @book.title
  @authors = Author.all
  erb(:book_edit)
end

patch '/librarian/:id' do
  book_id = params.fetch("id").to_i
  @book = Book.find_id(book_id)
  author_ids = params.fetch("author_ids")
  @book.update({:author_ids => author_ids})
  @authors = Author.all
  erb(:book_edit)
end
