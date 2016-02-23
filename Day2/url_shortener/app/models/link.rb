class Link < ActiveRecord::Base

  def self.getShortLink(url)
    Link.where(short_url: "#{url}").first
  end 

  def self.check_http?(url)
    url.index("http") == 0 ? true : false
  end

  def self.get_random_short_url
    rand(36**3).to_s(36)
  end

end
