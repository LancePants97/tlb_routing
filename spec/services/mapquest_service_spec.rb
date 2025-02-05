require "rails_helper"

RSpec.describe "MapQuest Service" do
  it "returns ordered locations" do
    location1 = Location.create!(name: "Twin Lights Brewing", address: "4057 Asbury Ave, Tinton Falls, NJ")
    location2 = Location.create!(name: "The Chubby Pickle", address: "23 Bay Ave, Highlands, NJ")
    location3 = Location.create!(name: "Circus Middletown", address: "853 NJ-35, Middletown Township, NJ")
    location4 = Location.create!(name: "Bar Bella", address: "101 Crawfords Corner Rd, Holmdel, NJ")
    location5 = Location.create!(name: "Drifthouse", address: "1485 Ocean Ave, Sea Bright, NJ")
    location6 = Location.create!(name: "Mule Barn", address: "36 Kearney Rd, Highlands, NJ")
    location7 = Location.create!(name: "Scenic Liquors", address: "160 First Ave, Atlantic Highlands, NJ")
    location8 = Location.create!(name: "Royal Red Bank", address: "24 White St, Red Bank, NJ")
    location9 = Location.create!(name: "Bethany Wines & Liquors", address: "3160 NJ-35, Hazlet Township, NJ")
    location10 = Location.create!(name: "Watermark", address: "800 Ocean Ave, Asbury Park, NJ")

    locations = [
      location1.address,
      location2.address,
      location3.address,
      location4.address,
      location5.address,
      location6.address,
      location7.address,
      location8.address,
      location9.address,
      location10.address,
    ]

    api_key = Rails.application.credentials.mapquest[:key]

    # stub_request(:get, "https://www.mapquestapi.com/geocoding/v1/address")
    #   .with(query: { location: town, key: api_key })
    #   .to_return(status: 200, body: body)

    results = MapquestService.route_json(locations)

    expect(results).to be_a(Hash)
    expect(results).to have_key(:route)
    expect(results[:route]).to be_a(Hash)

    expect(results[:route]).to have_key(:locationSequence)
    expect(results[:route][:locationSequence]).to be_an(Array)
  end
end