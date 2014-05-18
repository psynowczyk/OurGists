class GistsController < ApplicationController
  before_action :set_gist, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, :only => [:show, :index, :new, :create, :stats]
  
  # GET /gists
  # GET /gists.json
  def index
    @gists = Gist.search(params[:snippet_search],params[:desc_search],params[:lang_search],params[:page])
    respond_to do |format|
       format.html
       format.js
    end
  end

  # GET /gists/1
  # GET /gists/1.json
  def show
    if (current_user && @gist.user_id != current_user.id) || (!current_user && @gist.user_id.present?)
      redirect_to gists_url
    end
  end

  def stats
  end

  def private
    @gists = Gist.paginate(:page => params[:page], :per_page => 10, :conditions => ['user_id = ? AND snippet LIKE ? AND description LIKE ? AND lang LIKE ?', current_user.id, "%#{params[:snippet_search]}%", "%#{params[:desc_search]}%", "%#{params[:lang_search]}%"], :order => 'updated_at DESC')
    respond_to do |format|
       format.html
       format.js
    end
  end

  # GET /gists/new
  def new
    @gist = Gist.new
  end

  # GET /gists/1/edit
  def edit
  end

  # POST /gists
  # POST /gists.json
  def create
    @gist = Gist.new(gist_params)
    captcha_message = "The data you entered for the CAPTCHA wasn't correct. Please try again."

    respond_to do |format|
      if current_user
        @gist.user_id = current_user.id
        if @gist.save
            format.html { redirect_to @gist, notice: 'Gist was successfully created.' }
            format.json { render action: 'show', status: :created, location: @gist }
        else
            format.html { render action: 'new' }
            format.json { render json: @gist.errors, status: :unprocessable_entity }
        end
      else
        if verify_recaptcha(:model => @gist, :message => captcha_message) && @gist.save
            format.html { redirect_to @gist, notice: 'Gist was successfully created.' }
            format.json { render action: 'show', status: :created, location: @gist }
        else
            format.html { render action: 'new' }
            format.json { render json: @gist.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /gists/1
  # PATCH/PUT /gists/1.json
  def update
    respond_to do |format|
      if @gist.update(gist_params)
        format.html { redirect_to @gist, notice: 'Gist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gists/1
  # DELETE /gists/1.json
  def destroy
    @gist.destroy
    respond_to do |format|
      format.html { redirect_to gists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gist
      @gist = Gist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gist_params
      params.require(:gist).permit(:user_id, :snippet, :lang, :description)
    end
end
