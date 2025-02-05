require 'rails_helper'

RSpec.describe 'Route Day Request' do
  it "can successfully return a response" do
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
  end

  it "can visit the page" do
    visit "/deliveries"
    save_and_open_page
  end
end