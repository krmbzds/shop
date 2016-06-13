user = User.create(
  username: 'john',
  email: 'john@exmaple.com',
  password: 'password'
)


product = Product.create(
  name: 'Nexus 4',
  price: '299'
)

cart = Cart.create(
  user: user
)

cart_item = CartItem.create(
  cart: cart,
  product: product,
  quantity: 1
)
