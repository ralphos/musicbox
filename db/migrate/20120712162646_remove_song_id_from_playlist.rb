class RemoveSongIdFromPlaylist < ActiveRecord::Migration
  def up
    remove_column :playlists, :song_id
  end

  def down
    add_column :playlists, :song_id, :integer
  end
end
