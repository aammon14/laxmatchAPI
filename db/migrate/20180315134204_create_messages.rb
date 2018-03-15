class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :player, foreign_key: true
      t.references :coach, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
