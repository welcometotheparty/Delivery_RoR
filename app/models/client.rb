class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  acts_as_taggable_on :tags

  has_many :packages

  def place
    Pony.mail(
      to: 'marsavin.grigory@yandex.ru',
      from: 'test mail pony gem',
      via: :smtp,
      attachments: {File.basename("#{attachment}") => File.read("#{attachment}")},
      via_options: {
        address: 'smtp.gmail.com',
        port: '587',
        user_name: 'grifon903live@gmail.com',
        password: '228Pudge',
        authentication: :plain,
        domain: 'mail.google.com'
      },
      subject: 'Test',
      body: 'LAlallalalal'
    )
  end

end
