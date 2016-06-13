require "bundler/setup"
require "sinatra"
# require "rack/csrf"
require "sinatra/activerecord"

Dir.glob(File.join("helpers", "**", "*.rb")).each do |helper|
  require_relative helper
end

require "sinatra/reloader" if development?

use Rack::Session::Cookie, :secret => "TODO: CHANGE ME"
# use Rack::Csrf, :raise => false

Dir["./models/*.rb"].each {|file| require file }

get "/" do
  erb :index
end

# 1
get "/users" do
  User.all.to_json
end

# 2
post "/users" do
  user = User.create(
    username: params['username'],
    email: params['email'],
    password: params['password']
  )
  user.to_json
end

# 3
get "/users/:id" do
  user = User.find_by id: params['id']
  user.to_json
end

# 4
get "/users/:id/carts" do
  user = User.find_by id: params['id']
  carts = Cart.find_by user_id: user.id
  carts.to_json
end

# 5
post "users/:user_id/carts" do
  cart = Cart.new(user_id: params['user_id'])
  cart.to_json
end

# 6
get "/products" do
  Product.all.to_json
end

# 7
post "/products" do
  product = Product.create(name: params['name'], price: params['price'])
  product.to_json
end

# 8
get "/products/:id" do
  product = Product.find_by id: params['id']
  product.to_json
end

# 9
get "/carts/:id" do
  cart = Cart.find_by id: params['id']
  cart.to_json
end

# 10
post "/carts/:cart_id/products" do

  params['quantity'] ||= 1

  pid, cid, qty = params.values_at('product_id', 'cart_id', 'quantity')
  cart_item = CartItem.find_by(product_id: pid, cart_id: cid)

  if cart_item
    if cart_item.update(quantity: cart_item.quantity + qty.to_i)
      CartItem.find_by(product_id: pid, cart_id: cid).to_json
    else
     resource_not_found
    end
  end

end

# 11
delete "/carts/:cart_id/products/:product_id" do
  cid, pid = params.values_at('cart_id', 'product_id')
  begin
    CartItem.find_by(cid, pid).destroy.to_json
  rescue
    resource_not_found
  end
end

# 12
put "/carts/:cart_id/products/:product_id" do
  begin
    pid, cid, qty = params.values_at('product_id', 'cart_id', 'quantity')
    cart_item = CartItem.find_by(cart_id: cid, product_id: pid)
    CartItem.update(cart_item.id, quantity: qty).to_json
  rescue
    resource_not_found
  end
end

# 13
put "/carts/:cart_id/clean" do
  CartItems.destroy_all!(cart_id: params['cart_id'])
end
