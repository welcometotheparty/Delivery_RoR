class Package < ApplicationRecord
  require 'open-uri'
  require 'json'
  require 'csv'

  validates :name, :surname, :patronymic, :number, :email, :weight, :length, :width, :height, :to_addr, :from_addr, presence: true

  def route_calculate(weight,length, width, height, point_from, point_to)
    dm_token = "VoTVkcF4oV6BNzRjCAo0VLYoTREUz"
    dm_link = "https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{point_from}&destinations=#{point_to}&key=#{dm_token}"
    dm_json = JSON.parse(URI.open(dm_link).string)
    distance = (dm_json["rows"][0]["elements"][0]["distance"]["text"]).tr('^0-9.', '')
    size = ((height.to_f * length.to_f * width.to_f) / 1000000.0).round(2)

    if size < 1
      price = distance.to_f
    elsif size > 1 and weight < 10
      price = distance.to_f * 2.0
    elsif size > 1 and weight > 10
      price = distance.to_f * 3.0
    end

    result = {weight: weight, length: length, width: width, height: height, distance: distance.to_f, price: price.round, size: size}
    return result
  end

end
