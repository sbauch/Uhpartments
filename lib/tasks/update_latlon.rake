namespace :db do
  namespace :seed do    
    desc 'For updating latlon'
    task :latlon => :environment do
          Building.find(:all).each do |b|
            if b.lat == nil
              #do nothing
            else
              @lat = b.lat
              @lon = b.lon
              b.latlon = "POINT (" + @lon.to_s + " " + @lat.to_s + ")"
              b.save
end
end
end
end
end