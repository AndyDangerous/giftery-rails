class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def after_sign_in_apth_for(resource)
    items_path
  end

  def index
  end
end
