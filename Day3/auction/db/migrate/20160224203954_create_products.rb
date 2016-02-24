class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user, index: true
      t.string :title
      t.string :description
      t.date :deadline

      t.timestamps null: false
    end
  end
end
