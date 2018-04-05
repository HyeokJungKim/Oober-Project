require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get "/newride" do
    @riders = Rider.all
    @drivers = Driver.all
    erb :newride
  end

  post "/newride" do
    @driver = Driver.find(params[:"driver.id"])
    @rider = Rider.find(params[:"rider.id"])
    Receipt.create(rider: @rider, driver: @driver)
    redirect "/riders/#{@rider.id}"
  end


end
