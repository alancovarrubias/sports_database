class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
    render status: 200, json: @seasons
  end

  def show
    @season = Season.find(params[:id])
    render status: 200, json: @season
  end
end
