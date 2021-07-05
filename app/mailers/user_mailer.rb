class UserMailer < ApplicationMailer
  def example(client)
    @client = params[:client]
    mail(to: 'marsavin.grigory@yandex.ru', subject: "You got a new order!")

  end
end
