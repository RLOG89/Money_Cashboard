require_relative('../models/transaction')

get '/transactions/?' do
  @transactions = Transaction.all
  erb(:'transactions/index')
end

get '/transactions/new' do
  @transactions = Transaction.all
  erb(:'transactions/new')
end

post '/transactions/?' do
  @transaction = Transaction.new( params )
  @transaction.save
  redirect to('/transactions')
end

get '/transactions/:id' do
  @transactions = Transaction.find( params[:id] ) 
  erb(:'transactions/show')
end