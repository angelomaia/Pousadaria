class Api::V1::InnRoomsController < ActionController::API
  def show
    render status: 200, json: {}
  end
end