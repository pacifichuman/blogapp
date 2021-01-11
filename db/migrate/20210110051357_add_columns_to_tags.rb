class AddColumnsToTags < ActiveRecord::Migration[6.1]
  def change
    add_column :tags, :user_id, :int
    add_column :tags, :article_id, :int
  end
end
