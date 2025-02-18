class DeliveriesController < ApplicationController
  def index
    @stops = []
  end

  def create
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
