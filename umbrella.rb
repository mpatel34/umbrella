require "http"

pp "Howdy"

pp "Where are you?"

#user_location = gets.chomp

user_location = "Chicago"

pp user_location

maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + ENV.fetch("MAPS")
 
resp = HTTP.get(maps_url)

raw_response = resp.to_s

require "json"

parsed_response = JSON.parse(raw_response)

results = parsed_response.fetch("results")

first_result = results.at(0)

geo = first_result.fetch("geometry")

location = geo.fetch("location")

lat = location.fetch("lat")
long = location.fetch("lng")

pp lat.to_s + long.to_s



weather_key = ENV.fetch("WEATHER") 

private_weather_url = "https://api.pirateweather.net/forecast/" + weather_key + user_location

pp raw_response = HTTP.get(private_weather_url)
