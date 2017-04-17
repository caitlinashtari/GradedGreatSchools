class GreatSchools
  # def initialize(zip)
  #   @zip = zip
  # end

  def get_great_schools
    response = HTTParty.get("http://api.greatschools.org/schools/CA/Alameda?key=#{ENV['GREAT_SCHOOLS_KEY']}")
    response
  end
end
