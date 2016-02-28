class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.references :artist, index: true
      t.string :artist_name
      t.string :venue
      t.string :city
      t.date :date
      t.float :price
      t.string :description

      t.timestamps null: false
    end
  end
end
