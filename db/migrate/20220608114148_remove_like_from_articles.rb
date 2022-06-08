class RemoveLikeFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :like, :integer
  end
end
