class Usa < ActiveRecord::Base

validates_uniqueness_of :title
validates :title, :url, :date, :summary, presence: true
validates_length_of :title, :minimum => 3

end
