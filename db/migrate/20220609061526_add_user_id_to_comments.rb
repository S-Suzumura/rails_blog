class AddUserIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :UserID, :integer
  end
end
