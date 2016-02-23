class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order("name ASC")
    render 'index'
  end

  def new
   render 'new'
  end

  def create
    if(params[:contact][:name].length > 0 && params[:contact][:address].length > 0)
      contact = Contact.new(
        :name => params[:contact][:name],
        :address => params[:contact][:address],
        :phone => params[:contact][:phone],
        :email => params[:contact][:email])
      contact.save
      redirect_to("/contacts")
    else
      @name = params[:contact][:name]
      @address = params[:contact][:address]
      redirect_to("/error")
    end

  end

  def show
    @contact = Contact.find_by(id: params[:id_contact]) || render_404(params)

  end

  def error
    render 'error'
  end

  def favourites
    @favourites = Contact.all_favourites
  end

  def favourite
    @contact = Contact.find(params[:id_contact])
    @contact.favourite = true;
    @contact.save
    redirect_to("/favourites")
  end

  def search
    @contacts = Contact.search(params[:contact][:letter])
    render 'search'
  end

end
