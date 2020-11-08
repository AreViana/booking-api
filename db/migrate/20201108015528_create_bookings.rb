class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :ticket, null: false
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :schedule, null: false, foreign_key: true

      t.timestamps
    end

    add_index :bookings, :ticket, unique: true
  end
end
