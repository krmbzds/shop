require "rake/testtask"
require "sinatra/activerecord/rake"

task :default => "test:all"

# Import any external rake tasks
Dir.glob('tasks/*.rake').each { |r| import r }

desc "Start the development server"
task :server do
  port = ENV["PORT"] || 9292
  rack_env = ENV["RACK_ENV"] || "development"
  exec("bundle exec thin start -p #{port} -e #{rack_env}")
end

desc "Run IRB console"
task :console, :environment do |t, args|
  ENV['RACK_ENV'] = args[:environment] || 'development'
  exec "pry -r ./app"
end

namespace :test do
  Rake::TestTask.new(:unit) do |t|
    t.libs << 'test/unit'
    t.test_files = Dir["test/unit/**/*_test.rb"]
  end

  Rake::TestTask.new(:integration) do |t|
    t.libs << 'test/unit'
    t.test_files = Dir["test/integration/**/*_test.rb"]
  end

  desc "Run all tests"
  task :all => %w[test:unit test:integration]
end

namespace :db do
  task :load_config do
    require "./app"
  end
end
