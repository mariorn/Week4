class User < ActiveRecord::Base
  has_many :products
  
  validates :email, uniqueness: true
  validates :email, presence: true


end
