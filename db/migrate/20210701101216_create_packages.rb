class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.integer :weight
      t.integer :length
      t.integer :width
      t.integer :height
      t.decimal :distance
      t.decimal :price
      t.decimal :size
      t.integer :client_id
      t.string :from_addr
      t.string :to_addr
      t.string :number
      t.string :name
      t.string :surname
      t.string :patronymic

      t.timestamps
    end
  end
end
