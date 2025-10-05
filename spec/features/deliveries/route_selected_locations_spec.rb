require 'rails_helper'

RSpec.describe 'Route Delivery Day Request' do
  before(:each) do
    @location1 = Location.create!(name: "Twin Lights Brewing", address: "4057 Asbury Ave, Tinton Falls, NJ")
    @location2 = Location.create!(name: "The Chubby Pickle", address: "23 Bay Ave, Highlands, NJ")
    @location3 = Location.create!(name: "Circus Middletown", address: "853 NJ-35, Middletown Township, NJ")
    @location4 = Location.create!(name: "Bar Bella", address: "101 Crawfords Corner Rd, Holmdel, NJ")
    @location5 = Location.create!(name: "Drifthouse", address: "1485 Ocean Ave, Sea Bright, NJ")
    @location6 = Location.create!(name: "Mule Barn", address: "36 Kearney Rd, Highlands, NJ")
    @location7 = Location.create!(name: "Scenic Liquors", address: "160 First Ave, Atlantic Highlands, NJ")
    @location8 = Location.create!(name: "Royal Red Bank", address: "24 White St, Red Bank, NJ")
    @location9 = Location.create!(name: "Bethany Wines & Liquors", address: "3160 NJ-35, Hazlet Township, NJ")
    @location10 = Location.create!(name: "Watermark", address: "800 Ocean Ave, Asbury Park, NJ")
    
    visit "/deliveries"
  end

  it "can successfully return a response" do
    fill_in 'locations', with: '"4057 Asbury Ave, Tinton Falls, NJ" "23 Bay Ave, Highlands, NJ" "853 NJ-35, Middletown Township, NJ" "1485 Ocean Ave, Sea Bright, NJ"'
    click_on "Submit"
    expect(current_path).to eq deliveries_path
    within("#stops") do
      expect(page).to have_content(@location1.name)
      expect(page).to have_content(@location2.name)
      expect(page).to have_content(@location3.name)
      expect(page).to have_content(@location5.name)
      expect(page).to_not have_content(@location4.name)
      expect(page).to_not have_content(@location6.name)
      expect(page).to_not have_content(@location7.name)
      expect(page).to_not have_content(@location8.name)
      expect(page).to_not have_content(@location9.name)
      expect(page).to_not have_content(@location10.name)
    end

    within("#all_accounts") do
      expect(page).to have_content(@location1.name)
      expect(page).to have_content(@location2.name)
      expect(page).to have_content(@location3.name)
      expect(page).to have_content(@location4.name)
      expect(page).to have_content(@location5.name)
      expect(page).to have_content(@location6.name)
      expect(page).to have_content(@location7.name)
      expect(page).to have_content(@location8.name)
      expect(page).to have_content(@location9.name)
      expect(page).to have_content(@location10.name)
    end
  end

  it "has error handling for improper addresses (missing 'NJ' from an address)" do
    fill_in 'locations', with: '"4057 Asbury Ave, Tinton Falls" "23 Bay Ave, Highlands, NJ" "853 NJ-35, Middletown Township, NJ" "1485 Ocean Ave, Sea Bright, NJ"'
    click_on "Submit"

    within("#stops") do
      expect(page).to have_content("4057 Asbury Ave, Tinton Falls - Address for this location is invalid. Please check your CSV file.")
      expect(page).to have_content(@location2.name)
      expect(page).to have_content(@location3.name)
      expect(page).to have_content(@location5.name)
    end
  end

  it "has error handling for too many addresses (max 26)" do
    fill_in 'locations', with: '"140 Ocean Ave, Sea Bright, NJ" "1237 NJ-166, Toms River, NJ" "14 Park Rd, Tinton Falls, NJ" "531 Cookman Ave, Asbury Park, NJ" "101 Crawford Corner Rd, Holmdel , NJ" "801 Main St, Belmar, NJ" "2 Beacon Hill Road, Atlantic Highlands , NJ" "14 NJ-36, Keansburg, NJ" "200 Port Au Peck Ave, Oceanport, NJ" "1126 NJ-35, Middletown, NJ" "200 Monmouth St, Red Bank, NJ" "180 Route 35 S, Eatontown , NJ" "59 W Front St, Keyport, NJ" "171 US-22 , Green Brook, NJ" "33 Broad Street, Red Bank, NJ" "23 Bay Ave, Highlands, NJ" "1455 NJ-35, Middletown, NJ" "426 NJ-36, Middletown, NJ" "395 Bloomfield Ave, Caldwell, NJ" "270 NJ-34, Colts Neck, NJ" "36 White Street, Red Bank, NJ" "2870 NJ-35, Hazlet, NJ" "146 West End Ct, Long Branch, NJ" "601 Main St, Loch Arbour, NJ" "701 Boulevard, Seaside Heights, NJ" "116 3rd Ave, Neptune, NJ" "1069 Route 9 North, Old Bridge, NJ"'
    click_on "Submit"
    expect(current_path).to eq deliveries_path

    within("#stops") do
      expect(page).to have_content("Exceeded maximum number of locations: Max=26, Actual=27")
    end
  end

  it "has error handling for no addresses" do
    fill_in 'locations', with: ""
    click_on "Submit"

    expect(page).to have_content("Please enter locations.")
  end
end