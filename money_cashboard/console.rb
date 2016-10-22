require('pry-byebug')
require_relative('./models/tag')
require_relative('./models/transaction')

tag1 = Tag.new({'name' => "Food", 'colour' => "blue"})
tag1.save

transaction1 = Transaction.new({'date' => '2016/10/22', 'merchant' => "Sainsburys", 'description' => "Weekly shop", 'amount' => 43.50, 'tag_id' => 2})
transaction1.save

binding.pry

