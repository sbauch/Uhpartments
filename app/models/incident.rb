class Incident < ActiveRecord::Base
belongs_to :building, :class_name => "Building", :foreign_key => 'building_address', 
           :primary_key => 'address', :counter_cache => true
scope :isopen, 
        where("incidents.closed IS NULL")
scope :isclosed, 
        where("incidents.closed IS NOT NULL")        
default_scope :order => 'created DESC'
WillPaginate.per_page = 25

end
class Incident  
  def calculate_elapsed
    if self.closed.blank?
      @difference = "Complaint Open"
    else
      d1 = created
      d2 = closed
      difference = d2 - d1
      difference_clean = difference.to_i
      @difference = difference_clean.to_s + ' Days'
    end 
  end
end