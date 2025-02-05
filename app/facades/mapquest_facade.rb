class MapquestFacade
  def self.route_locations(locations)
    data = MapquestService.route_json(locations)
    ordered_routes = data[:route][:locationSequence]

    deliveries = []
    ordered_routes.each do |num|
      loc = Location.find_by(address: locations[num])
      deliveries << loc.name
    end
    deliveries
  end
end
