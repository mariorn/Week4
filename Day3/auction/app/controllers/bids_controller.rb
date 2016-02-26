require 'pry'
class BidsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @bids = @product.bids.all.order(amount: :desc)
    @result = []
    @bids.each do |bid|
      @result << [ bid.amount, User.find(bid.user_id).name ]
      if @product.deadline < Date.today && @result.length == 1
        @result[0][1] = User.find(bid.user_id).name + " WINNER!!!" 
      end
    end
  end

  def new
    @bid = Bid.new
    @product = Product.find(params[:product_id])
  end


  def show
    @product = Product.find(params[:product_id])
    @bids = @product.bids.all
  end


  def create
    @product = Product.find(params[:product_id])
    @bid = @product.bids.new(bid_params)
    @user = User.find_by_email(params[:bid][:user_id])
    @bid.update_attributes(user_id: @user.id)

    if @product.deadline > Date.today 
      if @bid.amount >= @product.minimum
        if @bid.save
          redirect_to action: 'index'
        else
          render 'new'
        end
      else
      flash[:alert] = "Price minimum is #{@product.minimum}"
      render 'new'
      end
    else
      flash[:alert] = "Product no available"
      render 'new'
    end
  end


  private

  # def bid
  #   @_bid ||= bid.find(params[:bid_id])
  # end

  def bid_params
    params.require(:bid).permit(:amount )
  end


end
