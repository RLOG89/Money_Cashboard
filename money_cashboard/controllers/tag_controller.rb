require_relative('../models/tag')

get '/tags' do
  @tags = Tag.all
  erb(:'tags/index')
end