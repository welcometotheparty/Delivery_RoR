class HomepageController < ApplicationController
  before_action :authenticate_client!

  def home
    if current_client.org_admin
      redirect_to homepage_admin_home_path
    else
      @packages = Package.where(client_id: current_client.id ).page(params[:page])
    end
  end

  def admin_home
    @operators = Client.where(org_code: current_client.org_code).where.not(email: current_client.email)
    @packages = Package.where(org_code: current_client.org_code ).page(params[:page])
    @total_packages = @packages.length
    @average_price = 0
    @packages.map do |m|
      @average_price = @average_price + m.price
    end
    @average_price = @average_price / @packages.length
    @greatest_distance = @packages.order(:distance)[0]
    @smallest_distance = @packages.order(:distance).reverse[0]
    #puts "ETO DD #{@greatest_distance[0].distance}"


  end

  def search
    @parameter = params[:search].downcase
    @packages = Package.all.where("lower(operator) LIKE :search", search: @parameter).page(params[:page])
  end
end
