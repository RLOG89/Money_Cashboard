require('pry-byebug')
require_relative('./models/tag')
require_relative('./models/transaction')

tag1 = Tag.new({'name' => "Food", 'colour' => "blue"})
tag1.save
tag2 = Tag.new({'name' => "Pub", 'colour' => "red"})

transaction1 = Transaction.new({'date' => '2016/10/22', 'merchant' => "Sainsburys", 'description' => "Weekly shop", 'amount' => 43.50, 'tag_id' => tag1.id})
transaction1.save

transaction2 = Transaction.new({'date' => '2016/10/24', 'merchant' => "The Chanter", 'description' => "After work pints", 'amount' => 21.55, 'tag_id' => tag2.id})
transaction2.save
