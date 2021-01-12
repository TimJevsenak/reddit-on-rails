class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :icon

      t.timestamps
    end
  end
end
