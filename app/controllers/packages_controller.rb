class PackagesController < InheritedResources::Base
  def create
    build_resource
    hh = @package.route_calculate(@package.weight,@package.length, @package.width, @package.height, @package.from_addr, @package.to_addr)
    puts "А ЩАС БУДЕТ ХХ ХЕШ"
    puts hh
    @package.price = hh[:price]
    create!
  end

  private

    def package_params
      params.require(:package).permit(:weight, :length, :width, :height, :price, :size, :from_addr, :to_addr)
    end

end
