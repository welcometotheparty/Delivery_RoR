class Organization < ApplicationRecord
  validates :org_code, uniqueness: true
end
