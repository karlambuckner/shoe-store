ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require("brand")
require("store")

RSpec.configure do |config|
  config.after(:each) do
    Store.all().each() do |store|
      store.destroy()
    end
  end
end
