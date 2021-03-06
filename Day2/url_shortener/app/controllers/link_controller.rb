
class LinkController < ApplicationController


  def add
    Link.create(url: params[:shortlink], 
                short_url: Link.get_random_short_url, 
                visits: 0)
    redirect_to('/')
  end

  def home
    @links = Link.all
  end


  def show

    @link = Link.getShortLink(params[:shortlink])
    if @link
      @link.update_attribute(:short_url, Link.get_random_short_url)
      visits = @link.visits ||= 0
      @link.update_attribute(:visits, visits + 1)
      redirect_to(@link.url)
    end
  end



  def index
    @links = Link.all.order(visits: :desc).limit(10)
  end


end
