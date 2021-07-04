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
    @packages = Package.where(org_code: current_client.org_code ).page(params[:page])
  end

  def search
    if params[:search].blank?
      redirect_to(homepage_admin_home_path, alert: "Empty field!") and return
      puts 'пусто, не передан параметр'
    else
      @parameter = params[:search].downcase
      @results = Package.all.where("lower(operator) LIKE :search", search: @parameter)
    end
  end
end
