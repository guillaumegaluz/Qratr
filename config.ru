require 'sinatra'
require 'sinatra/contrib'

require './lib/sprockets_environment_builder'
require './app'

set :sprockets, SprocketsEnvironmentBuilder.build(ENV['RACK_ENV'] || 'development')

App.helpers do
  def haml_partial(page, options={})
    haml page, options.merge!(:layout => false)
  end

  def erb_partial(page, options={})
    erb page, options.merge!(:layout => false)
  end
end

map '/assets' do
  run settings.sprockets
end

map '/' do
  run App
end
