namespace :db do
  namespace :seed do
    require 'csv'
    desc 'Bring in stations'
    task :subway => :environment do 
      uri = '/Users/Sam/Desktop/Subway_Stations.csv'
        CSV.read(uri, :headers => true).each do |row|
        if row[5] == nil 
          Subway.create(
            :name => row[3],
            :lat => row[1],
            :lon => row[2],
            :train1 => row[4]
            )
        elsif row[6] == nil
         Subway.create(
       	    :name => row[3],
            :lat => row[1],
            :lon => row[2],
            :train1 => row[4],
            :train2 => row[5] 
            ) 
        elsif row[7] == nil
          Subway.create(
       	    :name => row[3],
            :lat => row[1],
            :lon => row[2],
            :train1 => row[4],
            :train2 => row[5],
            :train3 => row[6]
            )
       elsif row[8] == nil
          Subway.create(
       	    :name => row[3],
            :lat => row[1],
            :lon => row[2],
            :train1 => row[4],
            :train2 => row[5],
            :train3 => row[6],
            :train4 => row[7]
            )
        else
              Subway.create(
           	    :name => row[3],
                :lat => row[1],
                :lon => row[2],
                :train1 => row[4],
                :train2 => row[5],
                :train3 => row[6],
                :train4 => row[7],
                :train5 => row[8] 
                )    

          end
    end
  end
end
end