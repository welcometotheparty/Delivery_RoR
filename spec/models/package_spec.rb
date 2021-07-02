require 'rails_helper'

RSpec.describe Package, type: :model do
  it 'Correctly create Package objects' do
    package = Package.create!(weight: 12, length: 20, width: 30, height: 40, from_addr: 'Moscow', to_addr: 'Krasnodar')
    expect(package).to be_truthy
  end
end


