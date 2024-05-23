class CreateUserSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :user_schedules do |t|
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true
      t.timestamps
    end
    add_index :user_schedules, [:user_id, :schedule_id], unique: true
  end
end
