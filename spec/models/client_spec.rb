require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'client create' do
    it 'client correctly created' do
      Organization.create!(name: 'Компания Иванова', org_code: 111, org_admin_code: 111111, id:1 )
      c = Client.create!(email: 'operator@mail.ru', password: 'password', password_confirmation: 'password', org_code: 111, organization_id: 1)
      expect(c).to be_truthy
    end
  end
end
