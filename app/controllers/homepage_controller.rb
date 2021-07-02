class HomepageController < ApplicationController
  def home
    if current_client
      @packages = Package.where(client_id: current_client.id).page(params[:page])


    else
      redirect_to new_client_registration_path
    end

  end
end
