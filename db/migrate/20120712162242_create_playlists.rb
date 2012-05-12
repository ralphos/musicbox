class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.integer :song_id
      t.string :title

      t.timestamps
    end
  end
end
