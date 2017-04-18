class GreatSchools
  def initialize(lat, long, state)
    @lat = lat
    @long = long
    @state = state
  end

  def get_great_schools_nearby
    response = HTTParty.get("http://api.greatschools.org/schools/nearby?key=#{ENV['GREAT_SCHOOLS_KEY']}&state=#{@state}&lat=#{@lat}&lon=#{@long}&limit=20")
    response["schools"]["school"]
  end
end
