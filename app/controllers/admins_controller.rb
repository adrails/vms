class AdminsController < ApplicationController
	before_filter :validate_user_role
	def index
		@users = User.all
	end
	
	def show_user
		@user = User.find(params[:id])
	end
	
	def edit_user
		@user = User.find(params[:id])
	end

  def update_user
    @user = User.find(params[:id])

    respond_to do |format|
      @user.password = params[:user][:password]
			@user.password_confirmation=params[:user][:password_confirmation]
			if @user.save
        format.html { redirect_to admins_path, notice: 'User details was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit_user" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
	
  def destroy_user
		if current_user && current_user.role == "ADMIN"
			@user = User.find(params[:id])
			@user.destroy

			respond_to do |format|
				format.html { redirect_to admins_path }
				format.json { head :no_content }
			end
		end
  end
	
end
