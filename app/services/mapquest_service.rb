class MapquestService
  def self.route_json(locations)
    conn = Faraday.new("https://www.mapquestapi.com")
    response = conn.post("/directions/v2/optimizedroute") do |req|
      req.params[:key] = Rails.application.credentials.mapquest[:key]
      req.params[:avoids] = 'Toll Road'
      req.body = {
          "locations":
            locations
          }.to_json
      end
        
    JSON.parse(response.body, symbolize_names: true)
    # binding.pry
  end
end