class AddOrgCodeToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :org_code, :integer
  end
end
