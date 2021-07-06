require 'rails_helper'

RSpec.describe Package, type: :model do
  describe 'package' do
    it 'correctly create package' do
      Organization.create!(name: 'Компания Иванова', org_code: 111, org_admin_code: 111111, id:1)
      Client.create!(email: 'operator@mail.ru', password: 'password', password_confirmation: 'password', org_code: 111, organization_id: 1, id:1)
      p = Package.create!(email: 'yyy@mail.ru',weight: 1, length: 1, width: 1, height: 1, from_addr: 'Moscow', to_addr: 'Krasnodar', name: 'Artsssem', surname: 'Iasdasdov', patronymic: 'Ivanovich', number: '1111111', price: 20.0, size: 0.2, org_code: 111, distance: 134, operator: 'operator_sec@mail.ru', organization_id: 1, client_id: 1)
      expect(p).to be_truthy
    end
  end
end


