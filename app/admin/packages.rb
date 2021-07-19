ActiveAdmin.register Package do
  permit_params :weight, :status, :length, :width, :height, :price, :size, :from_addr, :to_addr, :name, :surname, :patronymic, :number, :org_code, :email, :distance, :operator, :organization_id, :client_id

  controller do
    def update
      build_resource
      update!
      puts 'WORK CHECK'

      Pony.mail(
        to: @package.email,
        from: 'Route Calculator',
        via: :smtp,
        via_options: {
          address: 'smtp.gmail.com',
          port: '587',
          user_name: YOUR_GMAIL_HERE,
          password: YOUR_PASSWORD_HERE,
          authentication: :plain,
          domain: 'mail.google.com'
        },
        subject: 'Package created',
        body: 'Статус заявки был изменен'
      )
    end
  end


end
