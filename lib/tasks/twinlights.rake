require 'csv'
namespace :csv_load do
  task :locations => :environment do

    CSV.foreach('./db/data/tlb_accounts.csv', headers: true, header_converters: :symbol) do |row|
      name = row[:account]
      street = row[:address]
      town = row[:town]
      address = "#{street}, #{town}, NJ"
      loc = Location.create!(name: name, address: address)
      puts "#{loc.name} has been created!"
    end
    puts "All locations have been created!"
  end
end