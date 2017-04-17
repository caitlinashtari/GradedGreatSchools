class GreatSchools
  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def get_great_schools_nearby
    response = HTTParty.get("http://api.greatschools.org/schools/nearby?key=#{ENV['GREAT_SCHOOLS_KEY']}&state=OR&lat=#{@lat}&lon=#{@long}")
    response["schools"]["school"]
  end
end
