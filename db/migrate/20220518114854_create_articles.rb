class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.status :string
      t.integer :like, default: 0

      t.timestamps
    end
  end
end
