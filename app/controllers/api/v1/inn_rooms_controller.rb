class Api::V1::InnRoomsController < ActionController::API
  def show
    begin
      inn_room = InnRoom.find(params[:id])
      render status: 200, json: inn_room.as_json(except: [:created_at, :updated_at])
    rescue
      render status: 404, json: ''
    end
  end
end