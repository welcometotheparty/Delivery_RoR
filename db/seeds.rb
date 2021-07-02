# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Client.create!(email: 'client@mail.ru', password: 'password', password_confirmation: 'password')

rng = 1..40
rng.each do |n|
  Package.create!(weight: 12, length: 20, width: 30, height: 40, from_addr: 'Moscow', to_addr: 'Krasnodar', name: 'Artem', surname: 'Ivanov', patronymic: 'Ivanovich', number: '777777777', client_id: 1, price: 20.0, size: 0.2)
end

puts 'SEEDS DONE'