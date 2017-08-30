class WelcomeController < ApplicationController
  # def index
  #   api_key = "HDsU4wOvZAKTe5iPzQjijeLkF30ORbFiI4ScBEl5"
  #
  #   @connection = Faraday.get("https://developer.nrel.gov") do |faraday|
  #     faraday.headers["X-API-KEY"] = api_key
  #     # faraday.adapter Faraday.default_adapter
  #   end
  #   binding.pry
  #   response = @connection.get("/api/alt-fuel-stations/v1.format?api_key=#{api_key}")
  #   results = JSON.parse(response.body, symbolize_names: true)[:results]
  #   # @stations = Station.all
  # end

  def index
    @connection = Faraday.get("https://developer.nrel.gov")

    api_key = "HDsU4wOvZAKTe5iPzQjijeLkF30ORbFiI4ScBEl5"
    response = @connection.get("/api/alt-fuel-stations/v1.format?api_key=#{api_key}")
    JSON.parse(response.body)
    binding.pry
  end
end
