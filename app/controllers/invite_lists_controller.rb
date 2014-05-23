class InviteListsController < ApplicationController
  # GET /invite_lists
  # GET /invite_lists.json
  def index
    @invite_lists = InviteList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invite_lists }
    end
  end

  # GET /invite_lists/1
  # GET /invite_lists/1.json
  def show
    @invite_list = InviteList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invite_list }
    end
  end

  # GET /invite_lists/new
  # GET /invite_lists/new.json
  def new
    @invite_list = InviteList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invite_list }
    end
  end

  # GET /invite_lists/1/edit
  def edit
    @invite_list = InviteList.find(params[:id])
  end

  # POST /invite_lists
  # POST /invite_lists.json
  def create
    @invite_list = InviteList.new(params[:invite_list])

    respond_to do |format|
      if @invite_list.save
        format.html { redirect_to @invite_list, notice: 'Invite list was successfully created.' }
        format.json { render json: @invite_list, status: :created, location: @invite_list }
      else
        format.html { render action: "new" }
        format.json { render json: @invite_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invite_lists/1
  # PUT /invite_lists/1.json
  def update
    @invite_list = InviteList.find(params[:id])

    respond_to do |format|
      if @invite_list.update_attributes(params[:invite_list])
        format.html { redirect_to @invite_list, notice: 'Invite list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invite_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invite_lists/1
  # DELETE /invite_lists/1.json
  def destroy
    @invite_list = InviteList.find(params[:id])
    @invite_list.destroy

    respond_to do |format|
      format.html { redirect_to invite_lists_url }
      format.json { head :no_content }
    end
  end
end
