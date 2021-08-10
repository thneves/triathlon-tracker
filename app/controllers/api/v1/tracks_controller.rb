class Api::V1::TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
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

end
