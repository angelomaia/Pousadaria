class InnDashboard::GroupBookingsController < InnDashboard::InnDashboardController
  def new
    @group_booking = @inn.group_bookings.build
  end

  def create
    
  end
end