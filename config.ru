require './server/application'

unless ENV['RACK_ENV'] == 'production'
  map '/assets' do
    run App.sprockets
  end
end

map '/' do
  run App
end
