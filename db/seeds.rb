user = User.new(
  username: 'john',
  email: 'john@exmaple.com',
  password: 'password')

product = Product.new(
  name: 'Nexus 4',
  price: '299'
)

cart = Cart.new(
  user_id: user.id
)

cart_item = CartItem.new(
  cart_id: cart.id,
  product_id: product.id,
  quantity: 1
)

[user, product, cart, cart_item].each { |t| t.save! }
