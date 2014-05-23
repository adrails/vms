class Notifier < ActionMailer::Base
  default from: "adrails123@gmail.com"
	
	def vendor_invitation(vendor)
		@vendor = vendor
		@vendor_email = vendor.email
		mail(:to=>@vendor_email,:subject =>"Vendor Invitaion mail")
	end
	
	def user_notification(current_user)
		@current_user = current_user
		@user_email = @current_user.email
		mail(:to=>@user_email,:subject =>"User Invitaion mail")
	end
	
	def vendor_assgined_notification(vendor_owner)
		@vendor_owner = vendor_owner
		@vendor_owner_email = @vendor_owner.email
		mail(:to=>@vendor,:subject =>"Vedor Assigned Notification")
	end
	
end
