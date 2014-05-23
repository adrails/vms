class Vendor < ActiveRecord::Base
  attr_accessible :name, :email,:address,:is_active,:user_id
  has_many :services, :dependent => :destroy
	has_many :projects, :through => :invite_lists
	belongs_to :user
	accepts_nested_attributes_for :services
	validates :email, :uniqueness => true
end
