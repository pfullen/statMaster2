class StatsController < ApplicationController
	
require 'uri'
require 'net/http'
require 'openssl'

def index
api_key = ENV['api_key']
##url = URI("https://api.sportradar.us/mlb-t6/games/2014/REG/schedule.json?api_key=rsg2ehj4293rcr9x794dv7zr")
#url = URI("https://api.sportradar.us/mlb-t6/league/hierarchy.json?api_key=rsg2ehj4293rcr9x794dv7zr")
url = URI("https://api.sportradar.us/mlb-t6/league/depth_charts.json?api_key=" + api_key)

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)

response = http.request(request)
puts response.read_body

@response = JSON.parse(response.read_body)
@response = @response['teams'] #name => "Braves")  #[0]['name']


@response2 = JSON.parse(response.read_body)
#@market = @response['games']

@api = ENV['api_key']


	end
end