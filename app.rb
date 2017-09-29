require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('./lib/brand')
require('./lib/store')
require('pry')

get('/') do
  @stores = Store.all
  erb(:index)
end

post('/') do
  store_name = params['store_name']
  new_store = Store.create({:store_name => store_name})
  @stores = Store.all
  redirect('/')
end

get('/stores/:id') do
  @store = Store.find(params["id"].to_i)
  erb(:stores)
end
