require 'pry'
class DriversController < ApplicationController
  get '/drivers' do
    @drivers = Driver.all
    erb :"drivers/index"
  end

  get '/drivers/new' do
    erb :'drivers/new'
  end

  post '/drivers' do
    @driver = Driver.create(params[:driver])
    redirect "drivers/#{@driver.id}"
  end


  get '/drivers/:id/newride' do
    @driver = Driver.find(params[:id])
    @riders = Rider.all
    erb :'drivers/newride'
  end

  post '/drivers/:id/newride' do
    @driver = Driver.find(params[:id])
    @rider = Rider.find(params[:"rider.id"])
    Receipt.create(rider: @rider, driver: @driver)
    redirect "/drivers/#{@driver.id}"
  end

  get '/drivers/:id/edit' do
    @driver = Driver.find(params[:id])
    erb :"drivers/edit"
  end

  patch "/drivers/:id" do
    @driver = Driver.find(params[:id])
    @driver.update(params[:driver])
    redirect "/drivers/#{@driver.id}"
  end

  get'/drivers/:id' do
    @driver = Driver.find(params[:id])
    erb :'drivers/show'
  end

  delete '/drivers/:id' do
    Driver.destroy(params[:id])
    Receipt.all.each do |receipt|
      if receipt.driver_id == params[:id].to_i
        receipt.destroy
      end
    end
    redirect '/drivers'
  end

end
