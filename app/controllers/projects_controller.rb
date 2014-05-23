class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
	before_filter :authenticate_user!
	skip_filter :verify_authenticity_token, :assign_project
	before_filter :check_vendor_permission, :only => [:show, :edit, :destroy]
  def index
    @projects = Project.all
		@vendors = Vendor.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
		@project.user_id =current_user.id
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
	
	def check_vendor_permission
		@project = Project.find(params[:id])
		if @project.user_id == current_user.id
			return true
		else
			redirect_to projects_path
		end
	end
	
	def assign_project
		@project_id = params['project'].to_i
		@vendor_id = params['vendor'].to_i
		@service_ids = params['service_ids'].keys
		@project = Project.find(@project_id)
		@project.vendor_id = @vendor_id
		@project.services_ids = @service_ids
		@project.save
		
		if !@project_id.nil?
			@vendor = Vendor.find(@vendor_id)
			@current_user = current_user
			@vendor_owner = @vendor.user
			Notifier.vendor_invitation(@vendor).deliver
			Notifier.user_notification(@current_user).deliver
			if @current_user.email != @vendor_owner.email
				Notifier.vendor_assgined_notification(@vendor_owner).deliver
			end
			InviteList.create(:invited_status => true, :vendor_id=> @vendor_id, :project_id => @project_id, :invited_id=>current_user.id, :invitee_id=> @vendor_owner.id, :invitation_sent_at=> Time.now)
			flash[:notice] =  "Project assigned successfully!!"
			redirect_to projects_url
		else
			respond_to do |format|
					format.html { redirect_to vendors_path, notice: 'Please select a vendor to send a inivitation mail' }
			end
		end		
	end
	
end
