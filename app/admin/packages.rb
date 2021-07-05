ActiveAdmin.register Package do
  permit_params :weight, :status, :length, :width, :height, :price, :size, :from_addr, :to_addr, :name, :surname, :patronymic, :number, :org_code, :email, :distance, :operator

end
