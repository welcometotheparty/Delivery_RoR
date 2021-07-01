class HomepageController < ApplicationController
  def home
    if current_client
      @packages = Package.all
    else
      redirect_to new_client_registration_path
    end
  end
end
