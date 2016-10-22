require('pry-byebug')
require_relative('./models/tag')
require_relative('./models/transaction')

tag1 = Tag.new('name' => "Food", 'colour' => "blue")
tag1.save