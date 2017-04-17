class SchoolsController < ApplicationController
  before_action :set_school, only: [:show]
  before_action :authenticate_user!

  # GET /schools
  def index
    new_great_schools = GreatSchools.new
    @greatSchools = new_great_schools.get_great_schools_nearby()
  end

  # GET /schools/1
  def show
  end

  # POST /schools
  def create
    find_school = School.where(text: params[:text]).first
    if find_school
      redirect_to school_path(find_school.id)
    else
      @school = School.new(text: params[:text], latitude: params[:latitude], longitude: params[:longitude])
      if @school.save
        redirect_to school_path(@school)
      else
        render :new
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:text, :latitude, :longitude)
    end
end
