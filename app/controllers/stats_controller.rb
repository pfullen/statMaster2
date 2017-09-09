class StatsController < ApplicationController
	
require 'uri'
require 'net/http'
require 'openssl'

def index
api_key = ENV['api_key']
##url = URI("https://api.sportradar.us/mlb-t6/games/2014/REG/schedule.json?api_key=rsg2ehj4293rcr9x794dv7zr")
#url = URI("https://api.sportradar.us/mlb-t6/league/hierarchy.json?api_key=rsg2ehj4293rcr9x794dv7zr")
url = URI("https://api.sportradar.us/mlb-t6/league/depth_charts.json?api_key=" + api_key)
#url = URI("https://api.sportradar.us/mlb-t6/league/depth_charts.json?api_key=rsg2ehj4293rcr9x794dv7zr")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)

response = http.request(request)
puts response.read_body

@response = JSON.parse(response.read_body)
@teams = @response['teams']

@teams2 = @teams.select {|team| team["name"] == "Mets"}

 #@teams.each do |team| 
 #	puts team['name']
 ##		@positions.each do |pos| 
	# 	    @players = pos['players']
	 	    	
	 #	    		puts @players.inspect
	 #	    	end 
	 #	end
#end 
	 	
@positions = [{"name"=>"LF", "desc"=>"Left Field", "players"=>[{"id"=>"bba23f9e-8aac-454a-b8ca-9373b5d1e5b8", "status"=>"A", "position"=>"OF", "primary_position"=>"RF", "first_name"=>"Brandon", "last_name"=>"Nimmo", "jersey_number"=>"9",
 "preferred_name"=>"Brandon", "depth"=>1}, {"id"=>"97b88a83-f94e-4202-b49d-9e2ffab25919", "status"=>"A", "position"=>"IF", "primary_position"=>"3B", "first_name"=>"José", "last_name"=>"Reyes", "jersey_number"=>"7", "preferred_name"=>"José", "depth"=>2}, 
 {"id"=>"452aacde-4bdb-43cb-bc33-1ea0be41061f", "status"=>"A", "position"=>"IF", "primary_position"=>"3B", "first_name"=>"Matthew", "last_name"=>"Reynolds", "jersey_number"=>"15", "preferred_name"=>"Matt", "depth"=>3}, {"id"=>"52ff4ff2-ed67-481b-a15b-409ab013e212", "status"=>"A", "position"=>"OF", "primary_position"=>"LF", "first_name"=>"Norichika", "last_name"=>"Aoki", "jersey_number"=>"11", "preferred_name"=>"Nori", "depth"=>4}]}, {"name"=>"CF", "desc"=>"Center Field", "players"=>[{"id"=>"5e835495-61b6-411b-b454-48380d4cd665", "status"=>"A", "position"=>"OF", "primary_position"=>"CF", "first_name"=>"Juan", "last_name"=>"Lagares", "jersey_number"=>"12", "preferred_name"=>"Juan", "depth"=>1}, {"id"=>"bba23f9e-8aac-454a-b8ca-9373b5d1e5b8", "status"=>"A", "position"=>"OF", "primary_position"=>"RF", "first_name"=>"Brandon", "last_name"=>"Nimmo", "jersey_number"=>"9", "preferred_name"=>"Brandon", "depth"=>2}]}, {"name"=>"RF", "desc"=>"Right Field", "players"=>[{"id"=>"cee007d7-e460-43e1-8897-82d933094a38", "status"=>"A", "position"=>"OF", "primary_position"=>"RF", "first_name"=>"Travis", "last_name"=>"Taijeron", "jersey_number"=>"28", "preferred_name"=>"Travis", "depth"=>1}, {"id"=>"bba23f9e-8aac-454a-b8ca-9373b5d1e5b8", "status"=>"A", "position"=>"OF", "primary_position"=>"RF", "first_name"=>"Brandon", "last_name"=>"Nimmo", "jersey_number"=>"9", "preferred_name"=>"Brandon", "depth"=>2}]}, {"name"=>"3B", "desc"=>"Third Base", "players"=>[{"id"=>"45bca5ce-4514-4a91-9410-e201c7b0052d", "status"=>"A", "position"=>"IF", "primary_position"=>"3B", "first_name"=>"Wilmer", "last_name"=>"Flores", "jersey_number"=>"4", "preferred_name"=>"Wilmer", "depth"=>1}, {"id"=>"452aacde-4bdb-43cb-bc33-1ea0be41061f", "status"=>"A", "position"=>"IF", "primary_position"=>"3B", "first_name"=>"Matthew", "last_name"=>"Reynolds", "jersey_number"=>"15", "preferred_name"=>"Matt", "depth"=>2}, {"id"=>"63909aed-f094-4154-859f-bf45d81a5ebe", "status"=>"A", "position"=>"IF", "primary_position"=>"2B", "first_name"=>"Asdrubal", "last_name"=>"Cabrera", "jersey_number"=>"13", "preferred_name"=>"Asdrubal", "depth"=>3}, {"id"=>"97b88a83-f94e-4202-b49d-9e2ffab25919", "status"=>"A", "position"=>"IF", "primary_position"=>"3B", "first_name"=>"José", "last_name"=>"Reyes", "jersey_number"=>"7", "preferred_name"=>"José", "depth"=>4}, {"id"=>"addf3e07-1958-4b52-9c6e-0a784c7fdd01", "status"=>"A", "position"=>"IF", "primary_position"=>"3B", "first_name"=>"Phillip", "last_name"=>"Evans", "jersey_number"=>"72", "preferred_name"=>"Phillip", "depth"=>5}]}, {"name"=>"SS", "desc"=>"Shortstop", "players"=>[{"id"=>"e19efe62-ace7-4202-97bf-d457a71c50d5", "status"=>"A", "position"=>"IF", "primary_position"=>"SS", "first_name"=>"German", "last_name"=>"Rosario", "jersey_number"=>"1", "preferred_name"=>"Amed", "depth"=>1}, {"id"=>"97b88a83-f94e-4202-b49d-9e2ffab25919", "status"=>"A", "position"=>"IF", "primary_position"=>"3B", "first_name"=>"José", "last_name"=>"Reyes", "jersey_number"=>"7", "preferred_name"=>"José", "depth"=>2}, {"id"=>"63909aed-f094-4154-859f-bf45d81a5ebe", "status"=>"A", "position"=>"IF", "primary_position"=>"2B", "first_name"=>"Asdrubal", "last_name"=>"Cabrera", "jersey_number"=>"13", "preferred_name"=>"Asdrubal", "depth"=>3}]}, {"name"=>"2B", "desc"=>"Second Base", "players"=>[{"id"=>"63909aed-f094-4154-859f-bf45d81a5ebe", "status"=>"A", "position"=>"IF", "primary_position"=>"2B", "first_name"=>"Asdrubal", "last_name"=>"Cabrera", "jersey_number"=>"13", "preferred_name"=>"Asdrubal", "depth"=>1}, {"id"=>"a1d88d82-ad12-4652-bf3a-7db26069f354", "status"=>"A", "position"=>"IF", "primary_position"=>"SS", "first_name"=>"Gavin", "last_name"=>"Cecchini", "jersey_number"=>"2", "preferred_name"=>"Gavin", "depth"=>2}, {"id"=>"45bca5ce-4514-4a91-9410-e201c7b0052d", "status"=>"A", "position"=>"IF", "primary_position"=>"3B", "first_name"=>"Wilmer", "last_name"=>"Flores", "jersey_number"=>"4", "preferred_name"=>"Wilmer", "depth"=>3}]}, {"name"=>"1B", "desc"=>"First Base", "players"=>[{"id"=>"0203fb2b-3d49-40bd-b685-c6a5c388cade", "status"=>"A", "position"=>"IF", "primary_position"=>"1B", "first_name"=>"Dominic", "last_name"=>"Smith", "jersey_number"=>"22", "preferred_name"=>"Dominic", "depth"=>1}, {"id"=>"45bca5ce-4514-4a91-9410-e201c7b0052d", "status"=>"A", "position"=>"IF", "primary_position"=>"3B", "first_name"=>"Wilmer", "last_name"=>"Flores", "jersey_number"=>"4", "preferred_name"=>"Wilmer", "depth"=>2}]}, {"name"=>"SP", "desc"=>"Starting Pitcher", "players"=>[{"id"=>"e5cfe3b2-6596-4f08-bba7-f107ecae63c2", "status"=>"A", "position"=>"P", "primary_position"=>"SP", "first_name"=>"Jacob", "last_name"=>"deGrom", "jersey_number"=>"48", "preferred_name"=>"Jacob", "depth"=>1}, {"id"=>"a05b7bca-ea4b-4e56-99de-293371efc979", "status"=>"A", "position"=>"P", "primary_position"=>"SP", "first_name"=>"Matthew", "last_name"=>"Harvey", "jersey_number"=>"33", "preferred_name"=>"Matt", "depth"=>2}, {"id"=>"0600588b-39b2-49eb-9e77-208f8fdaca9b", "status"=>"A", "position"=>"P", "primary_position"=>"SP", "first_name"=>"Jacob", "last_name"=>"Lugo", "jersey_number"=>"67", "preferred_name"=>"Seth", "depth"=>3}, {"id"=>"0be3617f-5d44-4609-967b-d16bc9681c96", "status"=>"A", "position"=>"P", "primary_position"=>"SP", "first_name"=>"Rafael", "last_name"=>"Montero", "jersey_number"=>"50", "preferred_name"=>"Rafael", "depth"=>4}, {"id"=>"fae16ac1-d99d-4626-83c2-0a8e89545a2b", "status"=>"A", "position"=>"P", "primary_position"=>"SP", "first_name"=>"Christoper", "last_name"=>"Flexen", "jersey_number"=>"64", "preferred_name"=>"Chris", "depth"=>5}, {"id"=>"a95d91c3-2351-4a3a-8d74-c8e34da329dd", "status"=>"A", "position"=>"P", "primary_position"=>"SP", "first_name"=>"Robert", "last_name"=>"Gsellman", "jersey_number"=>"65", "preferred_name"=>"Robert", "depth"=>6}]}, {"name"=>"C", "desc"=>"Catcher", "players"=>[{"id"=>"6cc35dbd-458e-48a5-a187-99abccbc1abf", "status"=>"A", "position"=>"C", "primary_position"=>"C", "first_name"=>"Travis", "last_name"=>"d'Arnaud", "jersey_number"=>"18", "preferred_name"=>"Travis", "depth"=>1}, {"id"=>"b1f6fc22-f38e-4d77-a7e7-6a2ffdcf77f2", "status"=>"A", "position"=>"C", "primary_position"=>"C", "first_name"=>"Kevin", "last_name"=>"Plawecki", "jersey_number"=>"26", "preferred_name"=>"Kevin", "depth"=>2}]}, {"name"=>"BP", "desc"=>"Bullpen", "players"=>[{"id"=>"509ee425-cae4-4ca2-92c6-23c621e9ce2a", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"Alejandro", "last_name"=>"Ramos", "jersey_number"=>"44", "preferred_name"=>"A.J.", "depth"=>1}, {"id"=>"5ef86afa-fed3-4029-843d-f7fdb096d54a", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"Jerry", "last_name"=>"Blevins", "jersey_number"=>"39", "preferred_name"=>"Jerry", "depth"=>2}, {"id"=>"22dabc06-611e-4d36-81af-7153e7ba86e6", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"Paul", "last_name"=>"Sewald", "jersey_number"=>"51", "preferred_name"=>"Paul", "depth"=>3}, {"id"=>"4f82d295-a42a-4520-9844-35362a25d037", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"Jeurys", "last_name"=>"Familia", "jersey_number"=>"27", "preferred_name"=>"Jeurys", "depth"=>4}, {"id"=>"bfa1a383-47e5-4ddc-9bfa-6bd13235eddf", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"Erik", "last_name"=>"Goeddel", "jersey_number"=>"62", "preferred_name"=>"Erik", "depth"=>5}, {"id"=>"aacf4eee-3371-4ec4-870a-9012fd69e629", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"Hansel", "last_name"=>"Robles", "jersey_number"=>"47", "preferred_name"=>"Hansel", "depth"=>6}, {"id"=>"0ed11906-bd6f-44c0-aac7-9a3838658376", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"Joshua", "last_name"=>"Smoker", "jersey_number"=>"49", "preferred_name"=>"Josh", "depth"=>7}, {"id"=>"1d7d5e00-af19-4ad0-86d3-c2e9daf4c469", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"Chasen", "last_name"=>"Bradford", "jersey_number"=>"46", "preferred_name"=>"Chasen", "depth"=>8}, {"id"=>"6e86edc9-b40a-4ab2-b8ec-8b751041bc62", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"Tomaso", "last_name"=>"Milone", "jersey_number"=>"29", "preferred_name"=>"Tommy", "depth"=>9}, {"id"=>"81876426-9eef-4609-9f57-b0d14d5977cf", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"Jacob", "last_name"=>"Rhame", "jersey_number"=>"35", "preferred_name"=>"Jacob", "depth"=>10}, {"id"=>"785d153a-d3cb-487c-b695-63fb25925204", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"James", "last_name"=>"Callahan", "jersey_number"=>"43", "preferred_name"=>"Jamie", "depth"=>11}, {"id"=>"6c61de0f-a942-4759-b33a-bb5970459e83", "status"=>"A", "position"=>"P", "primary_position"=>"RP", "first_name"=>"Kevin", "last_name"=>"McGowan", "jersey_number"=>"61", "preferred_name"=>"Kevin", "depth"=>12}]}] 	 	 
	 

end












end