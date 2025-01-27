class CreateTeams < ActiveRecord::Migration[7.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
