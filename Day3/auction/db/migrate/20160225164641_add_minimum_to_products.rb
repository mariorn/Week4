class AddMinimumToProducts < ActiveRecord::Migration
  def change
    add_column :products, :minimum, :number
  end
end
