require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'Should register Alexey as a client' do
    client = Client.create(name: 'Алексей', surname: 'Федотов', patronymic: 'Иванович', number: '89991236688', email: 'alexey@mail.ru', password: 'password', password_confirmation: 'password')
    expect(client).to be_truthy
  end
end
