class AdditionalMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false
      t.timestamps
      t.index [:title, :artist_id], unique: true
    end

    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false
      t.timestamps
      t.index [:artwork_id, :viewer_id], unique: true
      t.index :artwork_id
      t.index :viewer_id
    end

    rename_column :users, :name, :username
  end
end
