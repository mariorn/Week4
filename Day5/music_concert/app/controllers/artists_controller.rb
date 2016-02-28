class ArtistsController < ApplicationController

  def index
    
    @artists = Artist.all
  end

  def details
    @artist = artist
    @concerts = @artist.concerts
    render '_details'
  end

  def edit
    @artist = artist
    render 'edit'
  end

  def add
    @artist = Artist.new
    render 'new'
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      flash[:notice] = "Entry created successfully"
      redirect_to action: 'index'
    else
      flash[:alert] = "Error. The entry hasn't benn created."
      render 'new'
    end
  end


  def concerts
    @artist = artist
    @concerts = @artist.concerts.order(date: :asc)
  end


  def show
    @artist = Artist.find(params[:id])
    @comments = Comment.get_comments(params[:concert_id])
    @comment = Comment.new
    @concert = Concert.find(params[:concert_id])
    @concerts = @artist.concerts
  end




  def update
    @artist = artist

    if @artist.update_attributes(artist_params)
      flash[:notice] = "Artist edited successfully"
      redirect_to action: 'index'
    else
      flash[:alert] = "Error. The artist hasn't benn edited."
      render 'edit'
    end

  end


  def destroy
    @artist = artist
    @entry = @artist.entries.find(params[:id])
    @entry.destroy
    redirect_to action: 'index', artist_id: @artist
  end


private

  def artist
    Artist.find(params[:artist_id])
  end

  def artist_params
    params.require(:artist).permit(:name, :web, :img)
  end

end
