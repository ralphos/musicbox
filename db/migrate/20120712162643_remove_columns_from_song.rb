class RemoveColumnsFromSong < ActiveRecord::Migration
  def up
    remove_column :songs, :user_id
    remove_column :songs, :tag
  end

  def down
    add_column :songs, :tag, :string
    add_column :songs, :user_id, :integer
  end
end
