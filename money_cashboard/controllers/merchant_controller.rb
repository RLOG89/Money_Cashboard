require_relative('../models/merchant')

get '/merchants/?' do
  @merchants = Merchant.all
  erb( :'merchants/index' )
end

get '/merchants/new' do
  erb( :'merchants/new' )
end

post '/merchants/?' do
  @merchant = Merchant.new( params )
  @merchant.save
  redirect to( '/merchants' )
end

get '/merchants/:id' do
  @merchant = Merchant.find( params[:id] )
  erb( :show )
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find( params[:id] )
  erb( :edit )
end

put '/merchants/:id' do
  @merchant = Merchant.update( params )
  redirect to( "/merchants/#{params[:id]}" )
end

put '/merchants/:id' do
  Merchant.destroy( params[:id] )
  redirect to ('/merchants')
end