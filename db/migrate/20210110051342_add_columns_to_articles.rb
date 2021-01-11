class AddColumnsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :title, :string
    add_column :articles, :description, :text
    add_column :articles, :user_id, :int
  end
end
