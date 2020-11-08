class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :place, null: false
      t.timestamp :date, null: false
      t.belongs_to :activity
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
