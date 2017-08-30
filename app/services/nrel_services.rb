class NRELServices

  def initialize
    @connection = Faraday.get("https://developer.nrel.gov")
  end

  def api_key
    "HDsU4wOvZAKTe5iPzQjijeLkF30ORbFiI4ScBEl5"
  end

  def receive_all_stations
    response = @connection.get("/api/alt-fuel-stations/v1.format?api_key=#{api_key}")
    JSON.parse(response.body)
  end

end
