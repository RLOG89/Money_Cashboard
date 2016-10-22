require_relative('../models/transaction')

get '/transactions' do
  @transactions = Transaction.all
  erb(:'transactions/index')
end

get '/transactions/new' do
  @transactions = Transaction.all
  erb(:'transactions/new')
end