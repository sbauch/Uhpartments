class Building < ActiveRecord::Base
attr_accessible :lat, :lon, :address, :city, :state, :zip
reverse_geocoded_by :lat, :lon
WillPaginate.per_page = 25
has_many :incidents, :class_name => "Incident", :foreign_key => 'building_address', :primary_key => 'address',

end

public
def foursquare2
  latlon = lat.to_s + "," + lon.to_s
  fsq_response = HTTParty.get("https://api.foursquare.com/v2/venues/search?ll="+ latlon +"&radius=500&limit=10&intent=browse&client_id=TPUY2K3PFHIGOLVB2UX1ZQZ2ONONITLV1LKHHZWGVPUMPYJ1&client_secret=TM2AQHNZ1B0LVEAFBLUCVAURLE33CRSYJRCV1WIJYN0EV0WW&v=20111109")
  response = fsq_response['response']
  venues = response['venues']
end

def foursquare_explore
  latlon = lat.to_s + "," + lon.to_s
  fsq_response = HTTParty.get("https://api.foursquare.com/v2/venues/explore?ll="+ latlon +"&radius=500&limit=10&client_id=TPUY2K3PFHIGOLVB2UX1ZQZ2ONONITLV1LKHHZWGVPUMPYJ1&client_secret=TM2AQHNZ1B0LVEAFBLUCVAURLE33CRSYJRCV1WIJYN0EV0WW&v=20111109")
   response = fsq_response['response']
   groups = response['groups']
   recommended = groups[0]
   items = recommended['items']
 
end

def score
  if self.incidents_count >= 75
    @score = "F"
  elsif self.incidents_count < 75 and self.incidents_count >= 50
    @score = "D"  
  elsif self.incidents_count < 50 and self.incidents_count >= 25
    @score = "C"
  elsif self.incidents_count < 25 and self.incidents_count >= 5
    @score = "B"
  elsif self.incidents_count < 5 and self.incidents_count > 0
    @score = "A"
  elsif self.incidents_count = 0
    @score = "A+"
  end 
end

def geosearch
  nearest = Building.where("ST_Distance(latlon, "+" '#{latlon}') < 100").map{ |b| b.address } 
end

def nabename
  response = HTTParty.get("http://streeteasy.com/nyc/api/areas/for_location?lon="+ lon.to_s + "&lat=" + lat.to_s + "&key=3c389a762a1363b7c2a6e1c581d852201a811334")
  response["area"]["name"] 
end
def streeteasy_0br
  response = HTTParty.get("http://streeteasy.com/nyc/api/areas/for_location?lon="+ lon.to_s + "&lat=" + lat.to_s + "&key=3c389a762a1363b7c2a6e1c581d852201a811334")
  @nabe_path = response["area"]["path"]
  output = HTTParty.get("http://streeteasy.com/nyc/api/rentals/data?criteria=area:"+ @nabe_path+"|beds:0&key=3c389a762a1363b7c2a6e1c581d852201a811334&format=json")
  @price = output["average_price"]
  @sqft = output["average_sqft"]
  @listings = output["listing_count"]
  @listings_url = output["search_url"]
  stats = Array.new([@price, @sqft, @listings, @listings_url])
end
def streeteasy_1br
  response = HTTParty.get("http://streeteasy.com/nyc/api/areas/for_location?lon="+ lon.to_s + "&lat=" + lat.to_s + "&key=3c389a762a1363b7c2a6e1c581d852201a811334")
  @nabe_path = response["area"]["path"]
  output = HTTParty.get("http://streeteasy.com/nyc/api/rentals/data?criteria=area:"+ @nabe_path+"|beds:1&key=3c389a762a1363b7c2a6e1c581d852201a811334&format=json")
  @price = output["average_price"]
  @sqft = output["average_sqft"]
  @listings = output["listing_count"]
  @listings_url = output["search_url"]
  stats = Array.new([@price, @sqft, @listings, @listings_url])
end
def streeteasy_2br
  response = HTTParty.get("http://streeteasy.com/nyc/api/areas/for_location?lon="+ lon.to_s + "&lat=" + lat.to_s + "&key=3c389a762a1363b7c2a6e1c581d852201a811334")
  @nabe_path = response["area"]["path"]
  output = HTTParty.get("http://streeteasy.com/nyc/api/rentals/data?criteria=area:"+ @nabe_path+"|beds:2&key=3c389a762a1363b7c2a6e1c581d852201a811334&format=json")
  @price = output["average_price"]
  @sqft = output["average_sqft"]
  @listings = output["listing_count"]
  @listings_url = output["search_url"]
  stats = Array.new([@price, @sqft, @listings, @listings_url])
end
   
def laundromats
  laundromats = Laundromat.near([self.lat, self.lon], 1.0 )
end
def distance
 distance = distance_to(self.laundromats[0], :units => :mi)
 distance_feet = distance * 5280
 rounded = distance_feet.to_i
end

def subways
  subways = Subway.near([self.lat, self.lon], 1.0 )
end
def subway_distance1
 distance = distance_to(self.subways[0], :units => :mi)
 distance_feet = distance * 5280
 rounded = distance_feet.to_i
end
def subway_distance2
 distance = distance_to(self.subways[1], :units => :mi)
 distance_feet = distance * 5280
 rounded = distance_feet.to_i
end
def subway_distance3
 distance = distance_to(self.subways[2], :units => :mi)
 distance_feet = distance * 5280
 rounded = distance_feet.to_i
end