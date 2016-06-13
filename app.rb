require "bundler/setup"
require "sinatra"
require "rack/csrf"
require "sinatra/activerecord"

Dir.glob(File.join("helpers", "**", "*.rb")).each do |helper|
  require_relative helper
end

require "sinatra/reloader" if development?

use Rack::Session::Cookie, :secret => "TODO: CHANGE ME"
use Rack::Csrf, :raise => true

Dir["./models/*.rb"].each {|file| require file }

get "/" do
  erb :index
end
