# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Location.delete_all

# Location.create!(name: "Twin Lights Brewing", address: "4057 Asbury Ave, Tinton Falls, NJ")
# location2 = Location.create!(name: "The Chubby Pickle", address: "23 Bay Ave, Highlands, NJ")
# location3 = Location.create!(name: "Circus Middletown", address: "853 NJ-35, Middletown Township, NJ")
# location4 = Location.create!(name: "Bar Bella", address: "101 Crawfords Corner Rd, Holmdel, NJ")
# location5 = Location.create!(name: "Drifthouse", address: "1485 Ocean Ave, Sea Bright, NJ")
# location6 = Location.create!(name: "Mule Barn", address: "36 Kearney Rd, Highlands, NJ")
# location7 = Location.create!(name: "Scenic Liquors", address: "160 First Ave, Atlantic Highlands, NJ")
# location8 = Location.create!(name: "Royal Red Bank", address: "24 White St, Red Bank, NJ")
# location9 = Location.create!(name: "Bethany Wines & Liquors", address: "3160 NJ-35, Hazlet Township, NJ")
# location10 = Location.create!(name: "Watermark", address: "800 Ocean Ave, Asbury Park, NJ")

Location.delete_all
Location.create!(name: "Twin Lights Brewing", address: "4057 Asbury Ave, Tinton Falls, NJ")
Rake::Task['csv_load:locations'].invoke