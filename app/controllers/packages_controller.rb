class PackagesController < InheritedResources::Base
  def create
    build_resource
    package_hash = @package.route_calculate(@package.weight,@package.length, @package.width, @package.height, @package.from_addr, @package.to_addr)
    @package.price = package_hash[:price]
    @package.size = package_hash[:size]
    puts "ЭТО САЙЗ В ХЕШЕ #{package_hash[:size]}"
    @package.client_id = current_client.id
    @package.org_code = current_client.org_code
    create!
  end

  private

    def package_params
      params.require(:package).permit(:weight, :length, :width, :height, :price, :size, :from_addr, :to_addr, :name, :surname, :patronymic, :number, :org_code)
    end

end
