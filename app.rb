require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/book'
require './lib/author'
require './lib/patron'
require './lib/inventory'
require 'pg'

DB = PG.connect
