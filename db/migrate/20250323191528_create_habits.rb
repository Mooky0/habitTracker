class CreateHabits < ActiveRecord::Migration[8.0]
  def change
    create_table :habits do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.boolean :is_daily, default: false
      t.string :color
      t.date :created_on, null: false

      t.timestamps
    end
  end
end
