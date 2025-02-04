class RoutesController < ApplicationController
  def create
    locations = params[:locations]
    json = MapquestService.route_json(locations)
    # binding.pry
  end
end