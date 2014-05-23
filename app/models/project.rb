class Project < ActiveRecord::Base
  attr_accessible :name,:is_active,:vendor_id,:user_id, :services_ids
  has_many :vendors, :through => :invite_lists
	has_many :services
  belongs_to :user
	serialize :services_ids
end
