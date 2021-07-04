class AddMailToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :email, :string
  end
end
