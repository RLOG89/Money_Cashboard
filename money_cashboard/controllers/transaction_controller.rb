require_relative('../models/transaction')

get '/transactions/?' do
  @transactions = Transaction.all
  erb( :'transactions/index' )
end

get '/transactions/new' do
  erb( :'transactions/new' )
end

post '/transactions/?' do
  @transaction = Transaction.new( params )
  @transaction.save
  redirect to( :'/transactions/create' )
end

get '/transactions/:id' do
  @transaction = Transaction.find( params[:id] ) 
  erb( :'transactions/show' )
end

get '/transactions/:id/edit' do 
  @transaction = Transaction.find( params[:id] )
  erb( :'transactions/edit' )
end

put '/transactions/:id' do
  @transaction = Transaction.update( params )
  redirect to( "/transactions/#{params[:id]}" )
end

put '/transactions/:id' do
  Transaction.destroy( params [:id] )
  redirect to ( '/transactions' )
end