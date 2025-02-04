class MapquestFacade
  def self.route_locations(locations)
    data = MapquestService.route_json(locations)
    ordered_routes = data[:route][:locationSequence]

    names = []
    ordered_routes.each do |num|
      names << locations[num]
    end
    # binding.pry
  end
end
