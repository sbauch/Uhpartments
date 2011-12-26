class Building < ActiveRecord::Base
attr_accessible :lat, :lon
reverse_geocoded_by :lat, :lon
WillPaginate.per_page = 25
has_many :incidents, :class_name => "Incident", :foreign_key => 'building_address', :primary_key => 'address',
end

public
def foursquare
  client = Foursquare2::Client.new(:client_id => 'TPUY2K3PFHIGOLVB2UX1ZQZ2ONONITLV1LKHHZWGVPUMPYJ1', :client_secret => 'TM2AQHNZ1B0LVEAFBLUCVAURLE33CRSYJRCV1WIJYN0EV0WW')
  @latlong = lat.to_s+","+lon.to_s
  response = client.search_venues(:ll => @latlong, :limit => 1, :radius => 200)
  end
def score
  if self.incidents_count >= 100
    @score = "F"
  elsif self.incidents_count < 100 and self.incidents_count >= 75
    @score = "D"  
  elsif self.incidents_count < 75 and self.incidents_count >= 50
    @score = "C"
  elsif self.incidents_count < 50 and self.incidents_count >= 25
    @score = "B"
  elsif self.incidents_count < 25 and self.incidents_count >= 5
    @score = "A"
  elsif self.incidents_count < 5
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
def streeteasy
  response = HTTParty.get("http://streeteasy.com/nyc/api/areas/for_location?lon="+ lon.to_s + "&lat=" + lat.to_s + "&key=3c389a762a1363b7c2a6e1c581d852201a811334")
  @nabe_path = response["area"]["path"]
  output = HTTParty.get("http://streeteasy.com/nyc/api/rentals/data?criteria=area:"+ @nabe_path +"&key=3c389a762a1363b7c2a6e1c581d852201a811334&format=json")
  @price = output["average_price"]
  @sqft = output["average_sqft"]
  @listings = output["listing_count"]
  stats = Array.new([@price, @sqft, @listings])
  
    
end
   
