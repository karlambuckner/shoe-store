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

post "/store" do
  store_name = params["store_name"]
  if !store_name.empty?
    @store = Store.new({store_name: store_name})
    @store.save
  end
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

post('/brand') do
  brand_name = params['brand_name']
  price = params['price']
  if !brand_name.empty?
    @brand = Brand.new({brand_name: brand_name, price: price})
    @brand.save
  end
  @brands = Brand.all
  @store = Store.all
  redirect('/')
end

get('/stores/:id') do
  @store = Store.find(params["id"])
  @store_brands = @store.brands
  @brands = Brand.all
  erb(:stores)
end

post('/brand/add/:id') do
  @store = Store.find(params["id"])
  @store.brands.push(Brand.find(params["brand_id"]))
  @store_brands = @store.brands
  @stores = Store.all
  id = params['id']
  redirect back
end

patch('/stores/:id/edit') do
  @store = Store.find(params["id"])
  @store.update({:new_store => new_store})
  @store_brands = @store.brands
  @brands = Brand.all
  redirect back
end

delete('/stores/:id/delete') do
  @store = Store.find(params["id"])
  @store.delete
  redirect("/")
end

get('/brands/:id') do
  @brand = Brand.find(params["id"])
  erb(:brands)
end

patch('/brands/:id/edit') do
  @brand = Brand.find(params["id"])
  @brand.update({:brand_name => "brand_name"})
  redirect back
end

patch('/brands/:id/price/edit') do
  @brand = Brand.find(params["id"])
  @brand.update({:price => "price"})
  redirect back
end

delete "/brands/:id/delete" do
  @brand = Brand.find(params[:id])
  @brand.delete
  redirect "/"
end
