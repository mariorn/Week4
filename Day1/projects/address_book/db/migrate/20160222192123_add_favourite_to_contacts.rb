class AddFavouriteToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :favourite, :boolean
  end
end
