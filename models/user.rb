class User < ActiveRecord::Base
  has_many :carts
  validates_presence_of :username, :email, :password
end
