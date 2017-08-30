class NRELServices

  def initialize
    @connection = Faraday.get("https://developer.nrel.gov/")
    binding.pry
  end

  def stations
    

end
