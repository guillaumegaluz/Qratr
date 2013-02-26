require './server/application'

if App.settings.respond_to?(:sprockets)
  map '/assets' do
    run App.settings.sprockets
  end
end

map '/' do
  run App
end
