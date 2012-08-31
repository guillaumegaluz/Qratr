class App < Sinatra::Base
  get '/' do
    @message = "YO"
    haml :index
  end

  get '/json-test' do
    json :test => {:hello => "world"}
  end
end
