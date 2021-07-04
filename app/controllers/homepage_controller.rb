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
    @filtered_packages = @packages.filter_by_operator(params[:operator]) if params[:operator].present?

  end
end
