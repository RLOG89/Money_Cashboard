require_relative('../models/transaction')

get '/transactions/?' do
  @transactions = Transaction.all
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