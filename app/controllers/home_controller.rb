class HomeController < ApplicationController
  def index
    if admin_signed_in?
      redirect_to items_users_url     
    else
      render
    end
      
  end
end
