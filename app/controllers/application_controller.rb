class ApplicationController < ActionController::Base
  protect_from_forgery
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  def after_sign_in_path_for(user)
		if user.role == "ADMIN"
			admins_path
		else
			vendors_path
		end
	end
	
	def validate_user_role
		if current_user && current_user.role == "ADMIN"
			admins_path
		else
			redirect_to vendors_path
		end
	end

  def record_not_found
		flash[:notice] = "No record found!!"
    redirect_to root_path
  end
	
end
