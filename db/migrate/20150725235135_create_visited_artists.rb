class CreateVisitedArtists < ActiveRecord::Migration
  def change
    create_table :visited_artists do |t|
      t.string :name
      t.string :image_url
      
      t.timestamps null: false
    end

    add_index :visited_artists, :name
  end
end
