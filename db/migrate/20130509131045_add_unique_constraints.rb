class AddUniqueConstraints < ActiveRecord::Migration
  def change
    add_index :stories, [:permalink, :feed_id], unique: true, :length => {:permalink => 512 }
    add_index :feeds, :url, unique: true, :length => {:url => 512 }
  end
end
