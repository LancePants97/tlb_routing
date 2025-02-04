class MapquestFacade
  def self.route_locations(locations)
    data = MapquestService.route_json(locations)
    all_times = data[:time]

    binding.pry
  end
end

{
  "locations": [
    "4057 Asbury Ave, Tinton Falls, NJ",
    "23 Bay Ave, Highlands, NJ",
    "853 NJ-35, Middletown Township, NJ",
    "610 Sixth Ave, Asbury Park, NJ"
  ]
}