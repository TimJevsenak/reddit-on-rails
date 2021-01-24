class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :community, null: false, foreign_key: true
      t.string :tittle
      t.text :post
      t.string :image

      t.timestamps
    end
  end
end
