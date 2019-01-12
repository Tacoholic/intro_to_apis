require 'http'

response = HTTP.get "https://data.cityofchicago.org/resource/ygr5-vcbg.json"
towed_cars = response.parse





towed_cars.each do |towed_car|
  car = towed_car["car"]
  plates = towed_car["plate"]
  puts "#{plates}"
end 
