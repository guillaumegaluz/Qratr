require 'colored'
require './lib/sprockets_environment_builder'

begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

task :test do
  %w{javascripts stylesheets specs}.each do |asset|
    Rake::Task["assets:compile_#{asset}"].invoke
  end
  Rake::Task["jasmine"].invoke
end

namespace :assets do
  desc 'compile sprockets to static files for testing purposes'

  task :compile_javascripts do
    compile_asset('public/test-assets', 'application.js', :development)
  end

  task :compile_stylesheets do
    compile_asset('public/test-assets', 'application.css', :development)
  end

  task :compile_specs do
    compile_asset('spec/javascripts', 'spec.js', :test)
  end
end

def compile_asset(parent_dir, filename, environment)
  sprockets = SprocketsEnvironmentBuilder.build(environment)
  FileUtils.mkdir_p(parent_dir)
  sprockets.find_asset(filename).write_to(File.join(parent_dir, filename))
  puts "Compiled: #{filename.green}"
end
