class HomeController < ApplicationController
  def index
   redirect_to items_users_url
  end
end
