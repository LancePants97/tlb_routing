class RoutesController < ApplicationController
  def create
    binding.pry
    locations = params[:locations]
    json = MapquestService.route_json(locations)
  end
end