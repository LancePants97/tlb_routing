class DeliveriesController < ApplicationController
  def index
    locations = params[:json]
    if locations
      @stops = MapquestFacade.route_locations(locations)
    end
  end
end