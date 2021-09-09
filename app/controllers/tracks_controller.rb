class TracksController < ApplicationController
  include CurrentUserConcern
  
  def index
    tracks = @current_user.tracks

    render json: {
      status: :ok,
      tracks: tracks,
    }
  end

  def create

    track = @current_user.tracks.create(track_params)
    if track.save
      render json: {
        status: :created,
        track: track,
      }
    else
      render json: {
        status: 500
      }
    end
  end

  def track_params
    params.require(:track).permit(:user_id, :sport, :day, :moving_time, :distance)
  end
end