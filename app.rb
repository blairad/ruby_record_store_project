require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')

get '/' do
  @albums = Album.all
  erb( :index )
end

get '/artist/:id' do
  @artists = Artist.find(params[:id])
  erb(:'artist/show')
end
