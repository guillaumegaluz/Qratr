class App < Sinatra::Base
  get '/' do
    @message = "YO"
    haml :index
  end
end
