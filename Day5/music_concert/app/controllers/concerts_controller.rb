class ConcertsController < ApplicationController

  def index
    @concerts = Concert.get_concerts
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)

    @artist = Artist.get_artist(@concert.artist_name)
    @concert.artist_id = @artist.id

    if @concert.save
      flash[:notice] = "Entry created successfully"
      redirect_to action: 'index'
    else
      flash[:alert] = "Error. The entry hasn't benn created."
      render 'new'
    end

  end

  def show
    @concert = concert
  end


  def edit
    @concert = concert
  end

  def update
    @concert = concert

    if @concert.update_attributes(concert_params)
      flash[:notice] = "Concert edited successfully"
      redirect_to action: 'index'
    else
      flash[:alert] = "Error. The concert hasn't benn edited."
      render 'edit'
    end

  end


  def destroy
    @concert = concert
    @entry = @concert.entries.find(params[:id])
    @entry.destroy
    redirect_to action: 'index', concert_id: @concert
  end


  def price
    @concerts = Concert.by_price(params[:concert][:price])
    render 'index'
  end


private

  def concert
    Concert.find(params[:id])
  end

  def concert_params
    params.require(:concert).permit(:artist_name, :venue, :city, :date, :price, :description)
  end

end
