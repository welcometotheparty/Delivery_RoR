class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :org_code
      t.integer :org_admin_code

      t.timestamps
    end
  end
end
