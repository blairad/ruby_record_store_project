require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
also_reload( '../models/*' )

#why can't i use album_controller while in a controllers folder?

# index
  get '/album' do
    @albums = Album.all
    erb(:"album/index")
  end

# new
  get '/album/new' do
    @albums = Album.all
    erb(:"album/new")
  end

# show
  get '/album/:id' do
    @albums = Album.find(params[:id])
    erb(:show)
  end

 # create
  post '/album' do
  album = Album.new(params)
  album.save()
  erb (:create)
end

# edit
  get '/album/:id/edit' do
    @album = Album.find(params).update
    erb (:edit)
  end
# update
post '/album/:id' do
  Album.new( params ).update
  redirect to '/album'
end
# destroy
post '/album/:id/delete' do
  album = Album.find( params[:id] )
  album.delete()
  redirect to '/album'
end
