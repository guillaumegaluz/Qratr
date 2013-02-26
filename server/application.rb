require 'sinatra'
require 'sinatra/contrib'
require 'json'
require 'yaml'

Config = YAML.load_file('config.yml')

ENV['RACK_ENV'] ||= 'development'
ENV['DATABASE_URL'] ||= "postgres://postgres@localhost/sinatra_backbone_#{ENV['RACK_ENV']}"

if ENV['DATABASE_URL']
  require 'sinatra/activerecord'
  db = URI.parse(ENV['DATABASE_URL'])

  DB_SETTINGS = {
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8',
    :pool     => 10,
    :port     => db.port,
  }

  ActiveRecord::Base.establish_connection(DB_SETTINGS)
end

%w[lib server server/models].each do |dir|
  Dir.glob("./#{dir}/*.rb").each do |relative_path|
    p relative_path
    require relative_path  unless relative_path == "./server/application.rb"
  end
end

class App < Sinatra::Base
  register Sinatra::Contrib
  set :logging, true
  set :sessions, true
  set :session_secret, Config['session_secret']
  set :root, File.expand_path(".")
  set :public_folder, Proc.new { File.join(root, "client/public") }
  set :views, Proc.new { File.join(root, "client/views") }

  configure :development, :test do
    set :dump_errors, true
    set :show_exceptions, true
    set :sprockets, SprocketsEnvironmentBuilder.build(ENV['RACK_ENV'])
  end

  configure :production do
    set :dump_errors, false
    set :show_exceptions, false
  end
end
