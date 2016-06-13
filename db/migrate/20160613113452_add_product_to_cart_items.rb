class AddProductToCartItems < ActiveRecord::Migration
  def change
    add_reference :cart_items, :product, index: true
  end
end
