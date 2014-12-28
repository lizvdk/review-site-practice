class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :image
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
