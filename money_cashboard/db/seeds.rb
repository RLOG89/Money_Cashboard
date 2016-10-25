require('pry-byebug')
require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/merchant')

Tag.delete_all
Merchant.delete_all
Transaction.delete_all

tags = [
  Tag.new({'name' => "Food", 'colour' => "blue", 'budget' => 200.00}),
  Tag.new({'name' => "Bills", 'colour' => "green", 'budget' => 150.00}),
  Tag.new({'name' => "Leisure", 'colour' => "green", 'budget' => 200.00}),
  Tag.new({'name' => "Transport", 'colour' => "purple", 'budget' => 100.00}),
  Tag.new({'name' => "Savings", 'colour' => "orange", 'budget' => 500.00}),
  Tag.new({'name' => "Purchases", 'colour' => "orange", 'budget' => 500.00}),
  Tag.new({'name' => "Holidays", 'colour' => "orange", 'budget' => 500.00}),
  Tag.new({'name' => "Direct Debits", 'colour' => "violet", 'budget' => 125.00})
]

tags.each do |tag|
  tag.save
end

merchants = [
  Merchant.new({'name' => "Tesco"}),
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
  date = '2016/10/22' #randomise later
  merchant = merchants.sample
  amount = 100.00 #randomise later
  transactions.push(Transaction.new({'date' => date, 'merchant_id' => merchant.id, 'amount' => amount, 'tag_id' => tag.id}))
end

# transactions = [
#   Transaction.new({'date' => '2016/10/22', 'merchant_id' => merchant2.id, 'amount' => 43.50, 'tag_id' => tag[0].id}),
#   Transaction.new({'date' => '2016/10/24', 'merchant_id' => merchant1.id, 'amount' => 21.55, 'tag_id' => tag[1].id}),
#   Transaction.new({'date' => '2016/10/26', 'merchant_id' => merchant3.id, 'amount' => 57.00, 'tag_id' => tag2.id}),
#   Transaction.new({'date' => '2016/10/30', 'merchant_id' => merchant6.id, 'amount' => 250.00, 'tag_id' => tag5.id}),
#   Transaction.new({'date' => '2016/10/28', 'merchant_id' => merchant7.id, 'amount' => 40.00, 'tag_id' => tag4.id}),
#   Transaction.new({'date' => '2016/10/29', 'merchant_id' => merchant1.id, 'amount' => 65.49, 'tag_id' => tag1.id}),
#   Transaction.new({'date' => '2016/10/30', 'merchant_id' => merchant2.id, 'amount' => 8.95, 'tag_id' => tag3.id}),
#   Transaction.new({'date' => '2016/10/30', 'merchant_id' => merchant2.id, 'amount' => 21.50, 'tag_id' => tag3.id}),
#   Transaction.new({'date' => '2016/10/30', 'merchant_id' => merchant8.id, 'amount' => 12.55, 'tag_id' => tag4.id})
# ]

transactions.each do |transaction|
  transaction.save
end

binding.pry
nil