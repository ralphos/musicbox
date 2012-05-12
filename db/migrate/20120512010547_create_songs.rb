class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :name
      t.string :link
      t.integer :user_id
      t.integer :tag

      t.timestamps
    end
  end
end
