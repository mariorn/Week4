class AddVisitsToLinks < ActiveRecord::Migration
  def change
    add_column :links, :visits, :integer
  end
end
