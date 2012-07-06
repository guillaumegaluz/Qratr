require 'compass'
require 'sprockets'
require 'sprockets-sass'
require 'bootstrap-sass'
require 'yui/compressor'
require 'uglifier'

class SprocketsEnvironmentBuilder
  def self.build(environment = :development)
    environment = environment.to_sym
    sprockets = Sprockets::Environment.new

    sprockets.append_path 'javascripts'
    sprockets.append_path 'stylesheets'
    #sprockets.append_path 'images'

    if environment == :test
      sprockets.append_path 'spec/coffeescripts'
    end
    if [:production, :test].include? environment
      sprockets.css_compressor = YUI::CssCompressor.new
      sprockets.js_compressor = Uglifier.new(mangle: false)
    end

    sprockets
  end
end
