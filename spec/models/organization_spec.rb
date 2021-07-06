require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'create organization' do
    it 'correctly create organization' do
      o = Organization.create!(name: 'Компания Иванова', org_code: 111, org_admin_code: 111111)
      expect(o).to be_truthy
    end
  end
end
