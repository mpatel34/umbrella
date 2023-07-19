require "http"

pp "Howdy"

pp "Where are you?"

user_location = gets.chomp

# user_location = "Chicago"

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

pp "Your coordinates are " + lat.to_s + long.to_s

weather_key = ENV.fetch("WEATHER") 

private_weather_url = "https://api.pirateweather.net/forecast/" + weather_key + "/" + lat.to_s + "," + long.to_s

resp_weather = HTTP.get(private_weather_url)

raw_response_weather = resp_weather.to_s

parsed_response_weather = JSON.parse(raw_response_weather)

currently = parsed_response_weather.fetch("currently")

temperature = currently.fetch("temperature")

pp "It is currently " + temperature.to_s

if currently.fetch("precipProbability") <= 10
  pp "Suck it up. You will be fine. Even if it did rain, it won't hurt... chill."
else
  pp "Bring an umbrella. Seriously. Perhaps even a poncho."
end
