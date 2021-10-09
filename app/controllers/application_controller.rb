class ApplicationController < ActionController::Base
    def prueba
        unless current_user.present? && current_user.admin == true 
          redirect_to root_path
        end
      end
end
