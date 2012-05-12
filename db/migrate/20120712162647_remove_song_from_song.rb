class RemoveSongFromSong < ActiveRecord::Migration
  def up
    remove_column :songs, :song
  end

  def down
    add_column :songs, :song, :string
  end
end
