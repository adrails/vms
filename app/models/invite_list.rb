class InviteList < ActiveRecord::Base
  attr_accessible :invited_status,:invitation_sent_at,:project_id, :vendor_id, :invited_id, :invitee_id
  belongs_to :project
  belongs_to :vendor
  belongs_to :user
end
