require 'yahoo_weatherman'
require "debugger"

class WeatherReader
	CITY_HASH = {"1" => 565346, "2" => 1062617, "3" => 1521894, "4" => 26235342, "5" => 468739, "6" => 2291072, "7" => 1118108, "8" => 718345}

	def fetch_temperature(city="1")
		client = Weatherman::Client.new
		response = client.lookup_by_woeid(CITY_HASH[city.to_i.to_s])
		return response.forecasts.first["high"].to_i	
	end	

end