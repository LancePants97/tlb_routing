class MapquestService
  def self.route_json(locations)
    address_array = locations.split('"').reject { |address| address.strip.empty? }
    conn = Faraday.new("https://www.mapquestapi.com")
    response = conn.get("/directions/v2/optimizedroute") do |req|
      req.params[:key] = Rails.application.credentials.mapquest[:key]
      req.params[:avoids] = 'Toll Road'
      req.params[:json] = { "locations": address_array }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end