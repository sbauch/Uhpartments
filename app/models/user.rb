class User < ActiveRecord::Base
 public


  def search_buildings
    nearest = Building.where("ST_Distance(latlon, "+" '#{location}') < 100").map{ |b| b.address }
  end
end