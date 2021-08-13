class TracksController < ApplicationController
  include CurrentUserConcern
  
  def index
    tracks = @current_user.tracks 
  end

  def create
    track = Track.create(track_params)
    if track.save
      render json: {
        status: :created,
        track: track
      }
    else
      render json: {
        status: 500
      }
    end
  end

  def show
    track = Track.find(params[:id])

    if track   
      render json: {
        status: :ok,
        track: track
      }
    else
      render json: {
        status: 500
      }
    end
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy

    render json: {
      status: :ok
    }
  end

  def track_params
    params.permit(:user_id, :sport, :day, :moving_time, :distance)
  end

end