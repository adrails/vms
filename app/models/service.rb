class Service < ActiveRecord::Base
  attr_accessible :is_active, :name,:vendor_id
  belongs_to :vendor
	belongs_to :project
	#validates :name, :uniqueness => true
end
