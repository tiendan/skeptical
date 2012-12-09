class HumanNamesController < ApplicationController
  # GET /human_names
  # GET /human_names.json
  def index
    @human_names = HumanName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @human_names }
    end
  end

  # GET /human_names/1
  # GET /human_names/1.json
  def show
    @human_name = HumanName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @human_name }
    end
  end

  # GET /human_names/new
  # GET /human_names/new.json
  def new
    @human_name = HumanName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @human_name }
    end
  end

  # GET /human_names/1/edit
  def edit
    @human_name = HumanName.find(params[:id])
  end

  # POST /human_names
  # POST /human_names.json
  def create
    @human_name = HumanName.new(params[:human_name])

    respond_to do |format|
      if @human_name.save
        format.html { redirect_to @human_name, :notice => 'Human name was successfully created.' }
        format.json { render :json => @human_name, :status => :created, :location => @human_name }
      else
        format.html { render :action => "new" }
        format.json { render :json => @human_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /human_names/1
  # PUT /human_names/1.json
  def update
    @human_name = HumanName.find(params[:id])

    respond_to do |format|
      if @human_name.update_attributes(params[:human_name])
        format.html { redirect_to @human_name, :notice => 'Human name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @human_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /human_names/1
  # DELETE /human_names/1.json
  def destroy
    @human_name = HumanName.find(params[:id])
    @human_name.destroy

    respond_to do |format|
      format.html { redirect_to human_names_url }
      format.json { head :no_content }
    end
  end
end
