class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.integer :zip_code
      t.integer :age
      t.text :bio
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
