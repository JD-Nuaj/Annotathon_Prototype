class CreateRevisions < ActiveRecord::Migration[7.2]
  def change
    create_table :revisions do |t|
      t.references :annotation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :change_log, null: false

      t.timestamps
    end
  end
end
