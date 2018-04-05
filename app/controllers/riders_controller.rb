class RidersController < ApplicationController

  get '/riders' do
    @riders = Rider.all
    erb :'riders/index'
  end

  get '/riders/new' do
    erb :"riders/new"
  end

  post '/riders' do
    @rider = Rider.create(params[:rider])
    redirect "riders/#{@rider.id}"
  end

  get '/riders/:id/newride' do
    @rider = Rider.find(params[:id])
    @drivers = Driver.all
    erb :"riders/newride"
  end

  post '/riders/:id' do
    @rider = Rider.find(params[:id])
    @driver = Driver.find(params[:"driver.id"])
    Receipt.create(rider: @rider, driver: @driver)
    redirect "/riders/#{@rider.id}"
  end

  get '/riders/:id/edit' do
    @rider = Rider.find(params[:id])
    erb :"riders/edit"
  end

  patch '/riders/:id' do
    @rider = Rider.find(params[:id])
    @rider.update(params[:rider])
    redirect "/riders/#{@rider.id}"
  end

  get '/riders/:id' do
    @rider = Rider.find(params[:id])
    erb :'riders/show'
  end

  delete '/riders/:id' do
    Rider.destroy(params[:id])
    Receipt.all.each do |receipt|
      if receipt.rider_id == params[:id].to_i
        receipt.destroy
      end
    end
    redirect '/riders'
  end


end
