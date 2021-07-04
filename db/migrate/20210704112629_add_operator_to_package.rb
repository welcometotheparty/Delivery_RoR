class AddOperatorToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :operator, :string
  end
end
