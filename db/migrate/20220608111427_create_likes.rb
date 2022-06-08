class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :account_id
      t.integer :article_id

      t.timestamps
    end
  end
end
