require('pry-byebug')
require_relative('./models/tag')
require_relative('./models/transaction')

tag1 = Tag.new({'name' => "Food", 'colour' => "blue"})
tag1.save
tag2 = Tag.new({'name' => "Pub", 'colour' => "red"})

transaction1 = Transaction.new({'date' => '2016/10/22', 'merchant_id' => merchant2.id, 'amount' => 43.50, 'tag_id' => tag1.id})
transaction1.save

transaction2 = Transaction.new({'date' => '2016/10/24', 'merchant_id' => merchant1.id, 'amount' => 21.55, 'tag_id' => tag2.id})
transaction2.save

merchant1 = Merchant.new({'name' => "Tesco"})
merchant2 = Merchant.new({'name' => "Brauhaus"})
merchant1.save
merchant2.save