class App < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/example-json-endpoint' do
    json({:some => "json"})
  end
end
