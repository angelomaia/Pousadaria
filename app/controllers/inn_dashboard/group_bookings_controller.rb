class InnDashboard::GroupBookingsController < InnDashboard::InnDashboardController
  def new
    @group_booking = @inn.group_bookings.build
  end

  def create
    @group_booking = @inn.group_bookings.build(group_booking_params)
    if @group_booking.save
      return redirect_to inn_management_path, notice: 'Reserva para Grupo criada com sucesso'
    end
    render :new, status: :unprocessable_entity
  end

  private

  def group_booking_params
    params.require(:group_booking).permit(:name, :start_date, :end_date)
  end
end