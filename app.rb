require 'sinatra'
require 'json'
require 'open-uri'

get '/' do
  erb :index
end

post '/' do
  @postcode = params[:postcode]
  json = open("https://maps.googleapis.com/maps/api/geocode/json?address=#{@postcode}").read
  address_info = JSON.parse(json)
  @latitude = address_info["results"][0]["geometry"]["location"]["lat"]
  @longitude = address_info["results"][0]["geometry"]["location"]["lng"]
  erb :map
end

# Google maps: AIzaSyBpqt0cDcenfhTCmjGD4tVGBk4IpBQaMrw
# Google geocoding: AIzaSyCLpN0ZOCudIE-8gQMxdpFIg7w5NA_1Ymg
