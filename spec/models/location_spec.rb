require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "class methods" do
    it "self.alphabetical" do
      location1 = Location.create!(name: "Twin Lights Brewing", address: "4057 Asbury Ave, Tinton Falls, NJ")
      location2 = Location.create!(name: "The Chubby Pickle", address: "23 Bay Ave, Highlands, NJ")
      location3 = Location.create!(name: "Circus Middletown", address: "853 NJ-35, Middletown Township, NJ")
      location4 = Location.create!(name: "Bar Bella", address: "101 Crawfords Corner Rd, Holmdel, NJ")
      location5 = Location.create!(name: "Drifthouse", address: "1485 Ocean Ave, Sea Bright, NJ")

      expect(Location.alphabetical).to eq([location4, location3, location5, location2, location1])
    end
  end
end