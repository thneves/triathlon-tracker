class TracksController < ApplicationController
  before_action :set_current_user
  include CurrentUserConcern
  
  def index
    tracks = @current_user.tracks

    render json: {
      status: :ok,
      tracks: tracks,
      current: @current_user,
      session: session
    }
  end

  def create

    track = @current_user.tracks.create(track_params)
    if track.save
      render json: {
        status: :created,
        track: track,
        current: @current_user
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