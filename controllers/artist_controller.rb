require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')
also_reload( '../models/*' )

# index
  get '/artist' do
    @artists = Artist.all
    @albums = Album.all
    erb(:"artist/index")
  end
# new
  get '/artist/new' do
    @artist = Artist.all
    erb(:'artist/new')
  end
# show
  get '/artist/:id' do
    @artist = Artist.find(params[:id])
    erb(:'artist/show')
  end
# create
  post '/artist/create' do
  @artists = Artist.new(params)
  @artists.save()
  erb (:'artist/create')
  end
# edit
  get '/artist/:id/edit' do
    @artist = Artist.find(params).update
    erb (:edit)
  end
# update
  post '/artist/:id' do
    Artist.new( params ).update
    redirect to '/artist'
  end
# destroy

  post '/artist/:id/delete' do
    artist = Artist.find( params[:id] )
    artist.delete()
    redirect to '/artist'
  end
