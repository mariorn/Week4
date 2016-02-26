class User < ActiveRecord::Base
  has_many :products
  has_many :bids
  
  validates :email, uniqueness: true
  validates :email, presence: true


  def find_by_email(address)

    User.where(email: address).first

  end


end
