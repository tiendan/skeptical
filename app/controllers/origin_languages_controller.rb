class OriginLanguagesController < ApplicationController
  # GET /origin_languages
  # GET /origin_languages.json
  def index
    @origin_languages = OriginLanguage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @origin_languages }
    end
  end

  # GET /origin_languages/1
  # GET /origin_languages/1.json
  def show
    @origin_language = OriginLanguage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @origin_language }
    end
  end

  # GET /origin_languages/new
  # GET /origin_languages/new.json
  def new
    @origin_language = OriginLanguage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @origin_language }
    end
  end

  # GET /origin_languages/1/edit
  def edit
    @origin_language = OriginLanguage.find(params[:id])
  end

  # POST /origin_languages
  # POST /origin_languages.json
  def create
    @origin_language = OriginLanguage.new(params[:origin_language])

    respond_to do |format|
      if @origin_language.save
        format.html { redirect_to @origin_language, :notice => 'Origin language was successfully created.' }
        format.json { render :json => @origin_language, :status => :created, :location => @origin_language }
      else
        format.html { render :action => "new" }
        format.json { render :json => @origin_language.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /origin_languages/1
  # PUT /origin_languages/1.json
  def update
    @origin_language = OriginLanguage.find(params[:id])

    respond_to do |format|
      if @origin_language.update_attributes(params[:origin_language])
        format.html { redirect_to @origin_language, :notice => 'Origin language was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @origin_language.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /origin_languages/1
  # DELETE /origin_languages/1.json
  def destroy
    @origin_language = OriginLanguage.find(params[:id])
    @origin_language.destroy

    respond_to do |format|
      format.html { redirect_to origin_languages_url }
      format.json { head :no_content }
    end
  end
end
