class AddForeignKeyToUsers < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :users, :teams
  end
end
