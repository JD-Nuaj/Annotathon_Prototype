class CreateForums < ActiveRecord::Migration[7.2]
  def change
    create_table :forums do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
