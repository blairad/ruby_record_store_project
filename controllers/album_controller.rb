require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
also_reload( '../models/*' )



# index
  get '/album' do
    @albums = Album.all
    @artists = Artist.all
    erb(:"album/index")
  end

# new
  get '/album/new' do
    @albums = Album.all
    @artist = Artist.all
    erb(:"album/new")
  end

# show
  get '/album/:id' do
    @albums = Album.find(params[:id])
    erb(:show)
  end

 # create
  post '/album/new' do
  @albums = Album.new(params)
  @albums.save()
  redirect to '/album'
  end

# edit
  get '/album/:id/edit' do
    @albums = Album.find(params).update
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
