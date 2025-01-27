class CreateAnnotations < ActiveRecord::Migration[7.2]
  def change
    create_table :annotations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :sequence, null: false
      t.string :status, null: false, default: 'pending'
      t.integer :grade
      t.text :comment

      t.timestamps
    end
  end
end
