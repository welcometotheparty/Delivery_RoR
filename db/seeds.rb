# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Organization.create!(name: 'Компания Иванова', org_code: 111, org_admin_code: 111111)
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Client.create!(email: 'operator@mail.ru', password: 'password', password_confirmation: 'password', org_code: 111)
Client.create!(email: 'operator_sec@mail.ru', password: 'password', password_confirmation: 'password', org_code: 111)
Client.create!(email: 'operator_three@mail.ru', password: 'password', password_confirmation: 'password', org_code: 222)

Client.create!(email: 'client@mail.ru', password: 'password', password_confirmation: 'password', org_admin: 111111, org_code: 111)


rng = 1..5
rng.each do |n|
  Package.create!(email: 'zzz@mail.ru', weight: 12, length: 20, width: 30, height: 40, from_addr: 'Moscow', to_addr: 'Krasnodar', name: 'Artem', surname: 'Ivanov', patronymic: 'Ivanovich', number: '777777777', client_id: 1, price: 20.0, size: 0.2, org_code: 111, operator: 'operator@mail.ru', distance: 64)
end

Package.create!(email: 'yyy@mail.ru',weight: 12, length: 20, width: 30, height: 40, from_addr: 'Moscow', to_addr: 'Krasnodar', name: 'Artsssem', surname: 'Iasdasdov', patronymic: 'Ivanovich', number: '1111111', price: 20.0, size: 0.2, org_code: 111, distance: 134, operator: 'operator_sec@mail.ru')
Package.create!(email: 'not_111@mail.ru',weight: 12, length: 20, width: 30, height: 40, from_addr: 'Moscow', to_addr: 'Krasnodar', name: 'Artsssem', surname: 'Iasdasdov', patronymic: 'Ivanovich', number: '1111111', price: 20.0, size: 0.2, org_code: 222, operator: 'operator_three@mail.ru')


puts 'SEEDS DONE'