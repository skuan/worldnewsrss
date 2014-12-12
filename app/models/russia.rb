class Russia < ActiveRecord::Base

  validates_uniqueness_of :title, :url, :author, :summary
  validates :title, :url, :author, :date, :summary, presence: true, :allow_blank => false


end
