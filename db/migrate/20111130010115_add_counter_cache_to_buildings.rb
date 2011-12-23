class AddCounterCacheToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :incidents_count, :integer, :default => 0
    Building.reset_column_information
    Building.find(:all).each do |b|
    Building.update_counters b.id, :incidents_count => b.incidents.count
    
          end
    end
  end
