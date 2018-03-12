class CreateCoaches < ActiveRecord::Migration[5.1]
  def change
    create_table :coaches do |t|
      t.integer :zip_code
      t.integer :price
      t.text :bio
      t.string :image 
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
