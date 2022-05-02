class Api::V1::TripsController < ApplicationController
  def index
    trips = Trip.order("created_at DESC")
    render json: trips
  end

  def create
    trip = Trip.create(trip_param)
    render json: trip
  end

  def update
    trip = Trip.find(params[:id])
    trip.update(trip_param)
    render json: trip
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
  end
  
  private
    def trip_param
      params.require(:trip).permit(:title, :done, :date_added, :user_id)
    end
end
