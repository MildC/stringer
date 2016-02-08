class UseTextDatatypeForTitleAndEntryId < ActiveRecord::Migration
  def up
    remove_index :stories, [:entry_id, :feed_id]
    change_column :stories, :title, :text
    change_column :stories, :entry_id, :text
    add_index :stories, [:entry_id, :feed_id], :length => {:entry_id => 512 }
  end

  def self.down
    remove_index :stories, [:entry_id, :feed_id]
    change_column :stories, :title, :string
    change_column :stories, :entry_id, :string
    add_index :stories, [:entry_id, :feed_id]
  end
end
