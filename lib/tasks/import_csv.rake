#this works for importing to db from a csv
namespace :db do
  namespace :seed do
    require 'csv'
    
    desc 'this is my task'
    task :buildings => :environment do 
      uri = '/Users/Sam/Desktop/output/data_al.csv'
        CSV.read(uri).each do |row|
          Building.find_or_create_by_address_and_zip(
            :address => row[9],
            :zip => row[8],
            :city => row[16],
            :lat => row[49],
            :lon => row[50]
            )
    end
  end
end
end