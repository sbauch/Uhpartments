namespace :db do
  namespace :destroy do
task :laundromats => :environment do 
  Laundromat.all.each do |l| 
    l.destroy
  end 
end
end
end