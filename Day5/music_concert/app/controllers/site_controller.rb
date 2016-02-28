class SiteController < ApplicationController

  def home
    @concerts_today = Concert.get_today_concerts
    @concerts_month = Concert.get_concerts_month
    @concert = Concert.new
  end

end
