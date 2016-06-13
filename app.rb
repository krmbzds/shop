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
  has_many :carts
  validates_presence_of :name, :email, :password
end

class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
end

class Product < ActiveRecord::Base
  validates_presence_of :name, :price
end

class CartItem < ActiveRecord::Base
  belongs_to :cart
  has_one :product
  validates_presence_of :quantity
end

get "/" do
  erb :index
end
