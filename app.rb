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

class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password

end

get "/" do
  erb :index
end
