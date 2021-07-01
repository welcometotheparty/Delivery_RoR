class Package < ApplicationRecord
  require 'open-uri'
  require 'json'

  def route_calculate(weight,length, width, height, point_from, point_to)
    dm_token = "VoTVkcF4oV6BNzRjCAo0VLYoTREUz"
    dm_link = "https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{point_from}&destinations=#{point_to}&key=#{dm_token}"
    dm_json = JSON.parse(URI.open(dm_link).string)
    puts "А вот это у нас DM_JSON #{dm_json}"
    distance = (dm_json["rows"][0]["elements"][0]["distance"]["text"]).tr('^0-9.', '')
    size = (height.to_f * length.to_f * width.to_f) / 1000000

    if size < 1
      price = distance.to_f
    elsif size > 1 and weight < 10
      price = distance.to_f * 2.0
    else
      price = distance.to_f * 3.0
    end

    result = {weight: weight, length: length, width: width, height: height, distance: distance.to_f, price: price.round}
    return result
  end

  def tester
    puts 'TETSTSTSTTTAAAA'
  end

end
