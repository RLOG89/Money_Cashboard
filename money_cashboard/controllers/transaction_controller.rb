require_relative('../models/transaction')
require('date')

get '/transactions/?' do
  min = params[:search1]
  max = params[:search2]
  start_date = params[:search3]
  end_date = params[:search4]
  @transactions = Transaction.all(min, max, start_date, end_date)
  erb( :'transactions/index' )
end

get '/transactions/new' do
  @tags = Tag.all
  @merchants = Merchant.all
  erb( :'transactions/new' )
end

post '/transactions/?' do
  @transaction = Transaction.new( params )
  @transaction.save
  redirect to( '/transactions' )
end

get '/transactions/:id' do
  @transaction = Transaction.find( params[:id] ) 
  erb( :'transactions/show' )
end

get '/transactions/:id/edit' do 
  @transaction = Transaction.find( params[:id] )
  @merchants = Merchant.all
  @tags = Tag.all
  erb( :'transactions/edit' )
end

put '/transactions/:id' do
  @transaction = Transaction.update( params )
  redirect to( "/transactions/#{params[:id]}" )
end

delete '/transactions/:id' do
  Transaction.destroy( params[:id] )
  redirect to ( '/transactions' )
end