class RoutesController < ApplicationController
  def create
    locations = params[:locations]
    # json = MapquestService.route_json(locations)
    json = MapquestFacade.route_locations(locations)
    # binding.pry
  end
end