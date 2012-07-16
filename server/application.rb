class App < Sinatra::Base
  register Sinatra::Contrib
  set :root, File.expand_path(".")
end

App.helpers do
  def haml_partial(page, options={})
    haml page, options.merge!(:layout => false)
  end

  def erb_partial(page, options={})
    erb page, options.merge!(:layout => false)
  end
end
