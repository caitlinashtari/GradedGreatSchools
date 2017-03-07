class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

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
