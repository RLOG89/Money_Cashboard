require('pry-byebug')
require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/merchant')

Tag.delete_all
Merchant.delete_all
Transaction.delete_all

tag1 = Tag.new({'name' => "Food", 'colour' => "blue", 'budget' => 200.00})
tag2 = Tag.new({'name' => "Bills", 'colour' => "red", 'budget' => 500.00})
tag3 = Tag.new({'name' => "Leisure", 'colour' => "green", 'budget' => 200.00})
tag4 = Tag.new({'name' => "Transport", 'colour' => "purple", 'budget' => 100.00})
tag5 = Tag.new({'name' => "Savings", 'colour' => "orange", 'budget' => 500.00})
tag1.save
tag2.save
tag3.save
tag4.save
tag5.save

merchant1 = Merchant.new({'name' => "Tesco"})
merchant2 = Merchant.new({'name' => "Brauhaus"})
merchant3 = Merchant.new({'name' => "GBEnergySupply"})
merchant4 = Merchant.new({'name' => "The Wally Dug"})
merchant5 = Merchant.new({'name' => "O2"})
merchant6 = Merchant.new({'name' => "Nationwide"})
merchant7 = Merchant.new({'name' => "BP"})
merchant8 = Merchant.new({'name' => "Uber"})
merchant1.save
merchant2.save
merchant3.save
merchant4.save
merchant5.save
merchant6.save
merchant7.save
merchant8.save

transaction1 = Transaction.new({'date' => '2016/10/22', 'merchant_id' => merchant2.id, 'amount' => 43.50, 'tag_id' => tag1.id})
transaction2 = Transaction.new({'date' => '2016/10/24', 'merchant_id' => merchant1.id, 'amount' => 21.55, 'tag_id' => tag2.id})
transaction3 = Transaction.new({'date' => '2016/10/26', 'merchant_id' => merchant3.id, 'amount' => 57.00, 'tag_id' => tag2.id})
transaction4 = Transaction.new({'date' => '2016/10/30', 'merchant_id' => merchant6.id, 'amount' => 250.00, 'tag_id' => tag5.id})
transaction5 = Transaction.new({'date' => '2016/10/28', 'merchant_id' => merchant7.id, 'amount' => 40.00, 'tag_id' => tag4.id})
transaction6 = Transaction.new({'date' => '2016/10/29', 'merchant_id' => merchant1.id, 'amount' => 65.49, 'tag_id' => tag1.id})
transaction7 = Transaction.new({'date' => '2016/10/30', 'merchant_id' => merchant2.id, 'amount' => 8.95, 'tag_id' => tag3.id})
transaction8 = Transaction.new({'date' => '2016/10/30', 'merchant_id' => merchant2.id, 'amount' => 21.50, 'tag_id' => tag3.id})
transaction9 = Transaction.new({'date' => '2016/10/30', 'merchant_id' => merchant8.id, 'amount' => 12.55, 'tag_id' => tag4.id})
transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save
transaction7.save
transaction8.save
transaction9.save