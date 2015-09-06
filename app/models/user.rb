class User < ActiveRecord::Base
  has_many :reviews
  has_may :products, through: :reviews
  has_secure_password
end
