class AddUserIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :UserID, :integer
  end
end
