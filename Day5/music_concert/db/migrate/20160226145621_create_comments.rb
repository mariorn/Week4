class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :concert, index: true
      t.string :comment
      t.string :email

      t.timestamps null: false
    end
  end
end
