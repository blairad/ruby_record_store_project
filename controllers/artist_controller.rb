require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')
also_reload( '../models/*' )

# index
  get '/artist' do
    @artists = Artist.all
    erb(:"artist/index")
  end
# show
  get '/artist/new' do
    @artists = Artist.new
    erb(:"artist/new")
  end
# new
  get 'artist/:id' do
    @artists = Artist.find(params[:id])
    erb(:show)
  end
# create
  post '/artist' do
  @artist = Artist.new(params)
  @artist.save()
  erb (:create)
  end
# edit
  get '/artist/:id/edit' do
    @artists = Artist.find(params).update
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
