class AddLatLonGeoToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :latlon, :point, :geographic => true
    
  end
end
