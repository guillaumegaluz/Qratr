require 'sinatra'
require 'sinatra/contrib'
require 'json'

%w[lib server].each do |dir|
  Dir.glob("./#{dir}/*.rb").each do |relative_path|
    p relative_path
    require relative_path  unless relative_path == "./server/application.rb"
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

class App < Sinatra::Base
  register Sinatra::Contrib
  set :root, File.expand_path(".")
  set :public_folder, Proc.new { File.join(root, "client/public") }
  set :views, Proc.new { File.join(root, "client/views") }
end

App.helpers do
  def haml_partial(page, options={})
    haml page, options.merge!(:layout => false)
  end

  def erb_partial(page, options={})
    erb page, options.merge!(:layout => false)
  end

  def json(body_hash, status=200, headers={})
    body = if params[:readable]
      JSON.pretty_generate(body_hash)
    else
      body_hash.to_json
    end
    halt status, headers.merge({'Content-Type' => 'application/json'}), body
  end
end
