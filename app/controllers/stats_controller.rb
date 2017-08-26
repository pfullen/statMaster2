class StatsController < ApplicationController
	
require 'uri'
require 'net/http'
require 'openssl'

def index
url = URI("https://api.sportradar.us/mlb-t6/games/2014/REG/schedule.json?api_key=rsg2ehj4293rcr9x794dv7zr")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)

response = http.request(request)
puts response.read_body

@response = JSON.parse(response.read_body)




	end
end