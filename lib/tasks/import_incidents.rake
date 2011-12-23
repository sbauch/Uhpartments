namespace :db do
  namespace :seed do
    require 'csv'
    desc 'Bring in associated incidents'
    task :incidents => :environment do 
      uri = '/Users/Sam/Desktop/output/data_al.csv'
        CSV.read(uri, :headers => true).each do |row|
        if row[2] == nil 
          Incident.create(
            :building_address => row[9],
            :agency => row[3],
            :complaint_type => row[6],
            :descriptor => row[5],
            :created => Date.strptime(row[1], '%m/%d/%Y')                    
            )
        else
          Incident.create(
            :building_address => row[9],
            :agency => row[3],
            :complaint_type => row[6],
            :descriptor => row[5],
            :created => Date.strptime(row[1], '%m/%d/%Y'),
            :closed => Date.strptime(row[2], '%m/%d/%Y')                     
            ) 
          end
    end
  end
end
end