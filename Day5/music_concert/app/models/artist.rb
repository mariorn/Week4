class Artist < ActiveRecord::Base
  has_many :concerts
  
  validates :name, presence: true

  def self.get_artist(artist_name)

    @artist = Artist.find_by(name: artist_name)
    @artist ? @artist : Artist.create(name: artist_name)

  end

end
