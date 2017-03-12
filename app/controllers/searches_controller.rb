class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /searches
  def index
    @search = Search.new
    @searches = Search.all
    if @searches.any?
      # refactor to return last only if user created search
      @last_search = Search.last
      @client = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
      @spots = @client.spots(@last_search.latitude, @last_search.longitude, :types => 'school')

      @hash = Gmaps4rails.build_markers(@spots) do |spot, marker|
        marker.lat spot.lat
        marker.lng spot.lng
        marker.infowindow spot.name
        marker.json({:id => spot.id})
      end
    end
  end

  # POST /searches
  def create
    @search = Search.new(search_params)
    respond_to do |format|
      if @search.save
        format.html { redirect_to searches_path }
        format.js
      else
        format.html { redirect_to searches_path }
        format.js
      end
    end
  end

  private
    # callbacks
    def set_search
      @search = Search.find(params[:id])
    end

    def search_params
      params.require(:search).permit(:latitude, :longitude, :address, :zip)
    end
end
