class DeliveriesController < ApplicationController
  def index
    @stops = []
    @accounts = Location.all
  end

  def create
    @accounts = Location.all
    locations = params[:locations]
    if locations.present?
      @stops = MapquestFacade.route_locations(locations)
      render :index
    else
      flash[:alert] = "Please enter locations."
      @stops = []
      render :index
    end
  end
end
