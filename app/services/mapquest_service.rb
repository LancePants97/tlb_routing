class MapquestService
  def self.route_json(locations)
    conn = Faraday.new("https://www.mapquestapi.com")

    response = conn.get("/geocoding/v1/address") do |req|
      req.params[:key] = Rails.application.credentials.mapquest[:key]
      req.body = {
        "locations": [
          locations
        ],
        "options": {
          "allToAll": true
        }
      }.to_json
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end