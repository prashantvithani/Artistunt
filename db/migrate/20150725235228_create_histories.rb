class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :user
      t.references :visited_artist
      t.integer :count, default: 0

      t.timestamps null: false
    end

    add_index :histories, :user_id
    add_index :histories, :visited_artist_id
    add_index :histories, [:user_id, :visited_artist_id], unique: true
  end

end
