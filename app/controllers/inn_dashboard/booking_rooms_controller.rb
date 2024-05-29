class InnDashboard::BookingRoomsController < InnDashboard::InnDashboardController
  def new
    @booking_room = BookingRoom.new
    @inn_rooms = @inn.inn_rooms
  end
end