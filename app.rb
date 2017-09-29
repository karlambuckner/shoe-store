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
  @brands = Brand.all
  erb(:index)
end

post('/store/new') do
  store_name = params['store_name']
  new_store = Store.create({:store_name => store_name})
  @stores = Store.all
  redirect('/')
end

post('/brand/new') do
  brand_name = params['brand_name']
  new_brand = Brand.create({:brand_name => brand_name})
  @brands = Brand.all
  redirect('/')
end

get('/stores/:id') do
  @store = Store.find(params["id"].to_i)
  erb(:stores)
end

get('/stores/:id/edit') do
  @store = Store.find(params["id"].to_i)
  erb(:edit)
end

patch('/stores/:id/edit') do
  @store = Store.find(params["id"].to_i)
  store_name = params['new_store']
  @store.update({:store_name => store_name})
  redirect("/stores/#{@store.id}")
end

delete('/stores/:id/edit') do
  @store = Store.find(params["id"].to_i)
  @store.delete
  redirect("/")
end

get('/brands/:id') do
  @brand = Brand.find(params["id"].to_i)
  erb(:brands)
end

# post('/brands/:id') do
#
#   erb(:brands)
# end
