namespace :db do
  namespace :seed do
    require 'csv'
    desc 'Bring in laundromats'
    task :buildings_laundromats => :environment do 
      uri = '/Users/Sam/Desktop/laundromats.csv'
        CSV.read(uri, :headers => true).each do |row|
        if row[3] == nil 
          Building.create(
            :name => row[2],
            :lat => row[4],
            :lon => row[5],
            :type => "laundromat"               
            )
        else
         Building.create(
       	    :name => row[3],
            :lat => row[4],
            :lon => row[5],   
            :type => "laundromat"                            
            ) 
          end
    end
  end
end
end