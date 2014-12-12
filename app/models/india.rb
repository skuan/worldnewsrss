class India < ActiveRecord::Base

validates_uniqueness_of :title
validates :title, :url, :date, :summary, presence: true
validates_length_of :title, :minimum => 3


	def self.dedupe
    # find all models and group them on keys which should be common
    	grouped = all.group_by{|model| [model.title,model.url,model.date, model.summary] }
   		grouped.values.each do |duplicates|
      # the first one we want to keep right?
   		  first_one = duplicates.shift # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
	      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
    	end
  	end

end

India.dedupe

