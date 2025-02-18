class MapquestFacade
  def self.route_locations(locations)
    address_array = locations.split('"').reject { |address| address.strip.empty? }
    data = MapquestService.route_json(locations)
    ordered_routes = data[:route][:locationSequence]
    deliveries = []
    if ordered_routes
      ordered_routes.each do |num|
        loc = Location.find_by(address: address_array[num])
        deliveries << loc.name
      end
      deliveries
    else
      data[:info][:messages]
    end
  end
end
