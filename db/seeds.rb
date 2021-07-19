# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Organization.create!(name: 'Компания Иванова', org_code: 111, org_admin_code: 111111, id:1 )
Organization.create!(name: 'Компания Сидорова', org_code: 222, org_admin_code: 222222, id:2)

User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Client.create!(email: 'operator@mail.ru', password: 'password', password_confirmation: 'password', org_code: 111, organization_id: 1, image: "https://images.unsplash.com/photo-1626159129266-e5bc98531d9c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80")
Client.create!(email: 'operator_sec@mail.ru', password: 'password', password_confirmation: 'password', org_code: 111, organization_id: 1)
Client.create!(email: 'operator_three@mail.ru', password: 'password', password_confirmation: 'password', org_code: 222, organization_id: 2)

Client.create!(email: 'client@mail.ru', password: 'password', password_confirmation: 'password', org_admin: 111111, org_code: 111, organization_id: 1, image: "https://images.unsplash.com/photo-1626159129266-e5bc98531d9c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80")
Client.create!(email: 'client222@mail.ru', password: 'password', password_confirmation: 'password', org_admin: 222222, org_code: 222, organization_id: 2, image: "https://images.unsplash.com/photo-1626159129266-e5bc98531d9c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80" )


rng = 1..30
rng.each do |n|
  Package.create!(email: 'zzz@mail.ru', weight: 12, length: 20, width: 30, height: 40, from_addr: 'Moscow', to_addr: 'Krasnodar', name: 'Artem', surname: 'Ivanov', patronymic: 'Ivanovich', number: '777777777', price: rand(10..1000), size: rand(5..100), org_code: 111, operator: 'operator@mail.ru', distance: rand(100..1000), organization_id: 1, client_id: 1)
end

#Посылки для второго оператора, чтобы проверить фильтр по операторам
rng = 1..5
rng.each do |n|
  Package.create!(email: 'xxx@mail.ru', weight: 12, length: 20, width: 30, height: 40, from_addr: 'Moscow', to_addr: 'Krasnodar', name: 'Artem', surname: 'Ivanov', patronymic: 'Ivanovich', number: '777777777', price: rand(10..1000), size: rand(5..100), org_code: 111, operator: 'operator_sec@mail.ru', distance: rand(100..1000), organization_id: 1, client_id: 1)
end

#Посылки для третьего оператора, принадлежащего к другой организации, чтобы проверить, что у админов разделены заявки по организациям
rng = 1..5
rng.each do |n|
  Package.create!(email: 'aaa@mail.ru', weight: 12, length: 20, width: 30, height: 40, from_addr: 'Moscow', to_addr: 'Krasnodar', name: 'Evgeny', surname: 'Ivanov', patronymic: 'Ivanovich', number: '777777777', price: rand(10..1000), size: rand(5..100), org_code: 222, operator: 'operator_three@mail.ru', distance: rand(100..1000), organization_id: 2, client_id: 3)
end

puts 'SEEDS DONE'