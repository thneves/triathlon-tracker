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
  end

  def update
  end

  def destroy
  end

  private
  
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
