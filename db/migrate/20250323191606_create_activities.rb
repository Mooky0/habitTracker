class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.references :habit, null: false, foreign_key: true
      t.date :date, null: false
      t.boolean :completed, default: false

      t.timestamps
    end

    add_index :activities, [:habit_id, :date], unique: true
  end
end
