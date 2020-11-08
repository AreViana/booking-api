class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.string :kind, null: false

      t.timestamps
    end

    add_index :activities, :kind
  end
end
