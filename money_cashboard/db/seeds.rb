require('pry-byebug')
require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/merchant')

Tag.delete_all
Merchant.delete_all
Transaction.delete_all

tags = [
  Tag.new({'name' => "Food", 'colour' => "#1B25D9", 'budget' => 200.00}),
  Tag.new({'name' => "Bills", 'colour' => "#1BD953", 'budget' => 150.00}),
  Tag.new({'name' => "Leisure", 'colour' => "#D91B1B", 'budget' => 200.00}),
  Tag.new({'name' => "Transport", 'colour' => "#861BD9", 'budget' => 100.00}),
  Tag.new({'name' => "Savings", 'colour' => "#1BD9D9", 'budget' => 500.00}),
  Tag.new({'name' => "Purchases", 'colour' => "#F7D31B", 'budget' => 350.00}),
  Tag.new({'name' => "Holidays", 'colour' => "#1BB0F7", 'budget' => 200.00}),
  Tag.new({'name' => "Direct Debits", 'colour' => "#F71B4C", 'budget' => 125.00})
]

tags.each do |tag|
  tag.save
end

merchants = [
  Merchant.new({'name' => "Sainsburys"}),
  Merchant.new({'name' => "Brauhaus"}),
  Merchant.new({'name' => "GBEnergySupply"}),
  Merchant.new({'name' => "The Wally Dug"}),
  Merchant.new({'name' => "O2"}),
  Merchant.new({'name' => "Nationwide"}),
  Merchant.new({'name' => "BP"}),
  Merchant.new({'name' => "Uber"}),
]

merchants.each do |merchant|
  merchant.save
end

transactions = Array.new

tags.each do |tag|
  3.times do 
    date = "#{Random.rand(6)+2010}/#{Random.rand(12)+1}/#{Random.rand(29)+1}" 
    merchant = merchants.sample
    amount = Random.rand(tag.budget-80) 
    transactions.push(Transaction.new({
      'date' => date, 
      'merchant_id' => merchant.id,
      'amount' => amount, 
      'tag_id' => tag.id}))
  end
end

transactions.each do |transaction|
  transaction.save
end
