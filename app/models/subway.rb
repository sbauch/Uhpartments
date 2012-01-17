class Subway < ActiveRecord::Base
  reverse_geocoded_by :lat, :lon
  
end
