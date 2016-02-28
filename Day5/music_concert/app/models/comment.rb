class Comment < ActiveRecord::Base
  belongs_to :concert

  def self.get_comments(concert_id)
    Comment.where(concert_id: concert_id)
  end

end
