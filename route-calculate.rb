class RouteCalculate
	require 'open-uri'
	require 'json'

	def route_calculate 
		dm_token = "VoTVkcF4oV6BNzRjCAo0VLYoTREUz"

		puts "Вес груза(кг)"
		weight = 12
		puts "Длина груза(см)"
		length = 20
		puts "Ширина груза(см)"
		width = 30
		puts "Высота груза(см)"
		height = 40
		puts "Пункт отправления"
		point_from = "Krasnodar"
		puts "Пункт назначения"
		point_to = "Moscow"

		dm_link = "https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{point_from}&destinations=#{point_to}&key=#{dm_token}"
		dm_json = JSON.parse(open(dm_link).string)
		distance = (dm_json["rows"][0]["elements"][0]["distance"]["text"]).tr('^0-9.', '')

		size = (height.to_f * length.to_f * width.to_f) / 1000000
		puts size 
		if size < 1
			price = distance.to_f
			puts 'work 1'
		elsif size > 1 and weight < 10
			price = distance.to_f * 2.0
			puts 'work 2'
		else
			price = distance.to_f * 3.0
			puts 'work 3'
		end 

		result = {weight: weight, length: length, width: width, height: height, distance: distance.to_f, price: price.round}
		
		return result 
	end 
end 

x = RouteCalculate.new
puts x.route_calculate



