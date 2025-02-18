class Location < ApplicationRecord
  def self.alphabetical
    order(:name)
  end
end