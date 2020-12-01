class CreateGuestBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :guest_bookings do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end