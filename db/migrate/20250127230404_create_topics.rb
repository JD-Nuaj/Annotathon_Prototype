class CreateTopics < ActiveRecord::Migration[7.2]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.text :description
      t.references :forum, null: false, foreign_key: true

      t.timestamps
    end
  end
end
