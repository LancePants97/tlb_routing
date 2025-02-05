class RoutesController < ApplicationController
  def create
    locations = params[:locations]
    @stops = MapquestFacade.route_locations(locations)
  end
end