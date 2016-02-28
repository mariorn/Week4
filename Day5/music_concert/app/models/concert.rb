class Concert < ActiveRecord::Base
  belongs_to :artist
  has_many :comments

  validates :artist_name, 
            :venue, 
            :city, 
            :date, 
            :price, 
            :description, 
            presence: true


  def self.get_concerts
    Concert.all.order(date: :asc)
  end

  def self.get_today_concerts
    Concert.where(date: Date.today)
  end

  def self.get_concerts_month
    from = Date.new(Date.today.year, Date.today.month, 1)
    to = from.end_of_month
    Concert.where(date: from..to)
  end

  def self.by_price(value)
    Concert.where("price < #{value}")
  end

end
