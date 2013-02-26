require './server/application.rb'
require 'sinatra/activerecord/rake'
require 'colored'
unless ENV['RACK_ENV'] == 'production'
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
end
require './lib/sprockets_environment_builder'

task :start do
  sh %{rerun --dir server -- unicorn -p #{ENV['PORT'] || 5000} -c ./unicorn.rb}
end

task :guard do
  require 'guard'
  Rake::Task["assets:compile_all"].invoke
  exec("bundle exec guard")
end

# http://www.zerolith.com/rake-tasks-for-non-rails-application.html
task 'db:schema:dump' do
  require 'active_record/schema_dumper'
  File.open(ENV['SCHEMA'] || "db/schema.rb", "w") do |file|
    ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
  end
end

task 'db:schema:load' do
  file = ENV['SCHEMA'] || "db/schema.rb"
  load(file)
end

task 'db:migrate' do
  Rake::Task["db:schema:dump"].invoke
end

task 'db:rollback' do
  Rake::Task["db:schema:dump"].invoke
end

namespace :assets do
  desc 'compile sprockets to static files for testing purposes'

  task :compile_all do
    %w{javascripts stylesheets specs}.each do |asset|
      Rake::Task["assets:compile_#{asset}"].invoke
    end
    puts "Finished asset precompilation".blue
  end

  task :compile_javascripts do
    compile_asset('client/public/.compiled', 'application.js', :development)
  end

  task :compile_stylesheets do
    compile_asset('client/public/.compiled', 'application.css', :development)
  end

  task :compile_specs do
    compile_asset('spec/.compiled', 'spec.js', :test)
  end

  task :precompile do
    compile_asset('client/public/assets', 'application.js', :production)
    compile_asset('client/public/assets', 'application.css', :production)
  end
end

def compile_asset(parent_dir, filename, environment)
  sprockets = SprocketsEnvironmentBuilder.build(environment)
  FileUtils.mkdir_p(parent_dir)
  sprockets.find_asset(filename).write_to(File.join(parent_dir, filename))
  puts "Compiled: #{filename.green}"
end
