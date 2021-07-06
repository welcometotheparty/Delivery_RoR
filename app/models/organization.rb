class Organization < ApplicationRecord
  validates :org_code, uniqueness: true

  has_many :packages
end
