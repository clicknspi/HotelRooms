class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.integer :bank_data
      t.boolean :validated
      t.date :start-date
      t.date :end-date

      t.timestamps
    end
  end
end
