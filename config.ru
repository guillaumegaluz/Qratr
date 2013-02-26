require './server/application'

if App.settings.respond_to?(:sprockets)
  map App.settings.sprockets_prefix do
    run App.settings.sprockets
  end
end

map '/' do
  run App
end
