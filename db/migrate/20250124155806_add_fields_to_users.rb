class AddFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :role, :string, null: false, default: 'annotator'
    add_reference :users, :team

    # Ajouter un index unique pour username
    add_index :users, :username, unique: true
  end
end
