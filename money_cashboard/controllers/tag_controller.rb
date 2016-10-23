require_relative('../models/tag')

get '/tags/?' do
  @tags = Tag.all
  erb( :'tags/index' )
end

get '/tags/new' do
  erb( :'tags/new' )
end

post '/tags/?' do
  @tag = Tag.new( params )
  @tag.save
  redirect to( :'/tags/create' )
end

get '/tags/:id' do
  @tag = Tag.find( params[:id] )
  erb( :show )
end

get '/tags/:id/edit' do
  @tag = Tag.find( params[:id] )
  erb( :edit )
end

put '/tags/:id' do
  @tag = Tag.update( params )
  redirect to( "/tags/#{params[:id]}" )
end

put '/tags/:id' do
  Tag.destroy( params[:id] )
  redirect to ('/tags')
end