class Api::V1::TracksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  def index
    @tracks = current_user.tracks.all
  end

  def show
    if authorized?
      respond_to do |format|
        format.json { render :show }
      end
    else
      handle_unauthorized
    end
  end

  def create
    @track = current_user.tracks.build(track_params)
    if authorized?
      respond_to do |format|
        if @track.save
          format.json { render :show, status: :created, location: api_v1_track_path(@track) }
        else
          format.json { render json: @track.errors, status: :unprocessable_entity }
        end
      end
    else
      handle_unauthorized
    end  
  end

  # Create a new @track instance variable that BUILDS a new Track from the current_user
  # I pass the track_params which re declare as a privated method. This concept is called strong parameters, and prevents mass assignment.

  def update
    if authorized?
      respond_to do |format|
        if @track.update(track_params)
          format.json { render :show, status: :ok, location: api_v1_track_path(@track) }
        else
          format.json ( render json: @track.errors, status: :unprocessable_entity)
        end
      end
    else
      handle_unauthorized
    end
  end

  def destroy
    if authorized?
      @track.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    else
      handle_unauthorized
    end
  end

  private

  def track_params
    params.require(:track).permit(:sport, :day, :distance, :moving_time)
  end
  
  def set_track
    @track = Track.find(params[:id])
  end

  def authorized?
    @track.user == current_user
  end

  def handle_unauthorized
    unless authorized?
      respond_to do |format|
        format.json { render :unauthorized, status: 401 }
      end
    end 
  end

end
