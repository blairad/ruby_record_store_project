require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')

get '/' do
  @albums = Album.all
  @artist = Artist.all
  erb( :index )
end

# get '/artist/:id' do
#   @artist = Artist.find(params[:id])
#   @albums = Album.all()
#   erb(:'artist/show')
# end

# get '/album/:id' do
#
#   erb(:'album/show')
# end
