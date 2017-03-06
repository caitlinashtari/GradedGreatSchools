class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    @search = Search.new
    @searches = Search.all
    if @searches.any?
      @last_search = Search.last
      @client = GooglePlaces::Client.new('AIzaSyCXYtb08IbxlM7vs60KJgJjhlEJM6xAuEg')
      @spots = @client.spots(@last_search.latitude, @last_search.longitude, :types => 'school')
    end
    @hash = Gmaps4rails.build_markers(@spots) do |spot, marker|
      marker.lat spot.lat
      marker.lng spot.lng
      marker.infowindow spot.name
      marker.json({:id => spot.id})
    end
  end


  # GET /searches/1
  # GET /searches/1.json
  def show
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)
    respond_to do |format|
      if @search.save
        format.html { redirect_to searches_path }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(params[:text])
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:latitude, :longitude, :address, :zip)
    end
end
