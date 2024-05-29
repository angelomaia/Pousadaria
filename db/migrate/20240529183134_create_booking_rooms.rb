class CreateBookingRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_rooms do |t|
      t.integer :people_quantity
      t.references :inn_room, null: false, foreign_key: true
      t.references :group_booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
