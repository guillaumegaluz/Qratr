class App < Sinatra::Base
  get '/' do
  	@playlists = Playlist.all
    haml :index
  end

  get '/:id' do
  	@playlist = Playlist.find(params[:id]) 
  	haml :playlist
  end
end
