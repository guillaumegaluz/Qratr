require 'sinatra'
require 'sinatra/contrib'

%w[lib server].each do |dir|
  Dir.glob("./#{dir}/*.rb").each do |relative_path|
    require relative_path
  end
end

set :sprockets, SprocketsEnvironmentBuilder.build(ENV['RACK_ENV'] || 'development')

configure :production do
  require 'newrelic_rpm'
  # Ensure the agent is started using Unicorn
  # This is needed when using Unicorn and preload_app is not set to true.
  # See http://support.newrelic.com/kb/troubleshooting/unicorn-no-data
  NewRelic::Agent.after_fork(:force_reconnect => true) if defined? Unicorn
end
