class HomeController < ApplicationController
  layout "home"
  def index
    if user_signed_in?
      if current_user.id == 1
        redirect_to controller: :districts , action: :index
      else
        redirect_to controller: :search_parking , action: :index
      end
      
    end
  end
end
