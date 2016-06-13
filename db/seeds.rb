user = User.create(
  username: 'john',
  email: 'john@exmaple.com',
  password: 'password'
)

product = Product.create(
  name: 'Nexus 4',
  price: '299'
)

product2 = Product.create(
  name: 'Nexus 5',
  price: '399'
)

cart = Cart.create(
  user: user
)

cart_item = CartItem.create(
  cart: cart,
  product: product,
  quantity: 1
)
