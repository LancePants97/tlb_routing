# class DeliveriesController < ApplicationController
#   def index
#     locations = params[:json]
#     if locations
#       @stops = MapquestFacade.route_locations(locations)
#     end
#   end
# end
class DeliveriesController < ApplicationController
  def index
    # Render the form to input locations
    @stops = []
  end

  def create
    locations = params[:locations]
    if locations.present?
      @stops = MapquestFacade.route_locations(locations)
      # Optionally, redirect or render a different view after the API call
      render :index
    else
      flash[:alert] = "Please enter locations."
      render :index
    end
  end
end
