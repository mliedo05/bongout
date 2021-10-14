class ApplicationController < ActionController::Base
  def prueba
    unless current_user.present? && current_user.admin == true 
      redirect_to root_path
    end
  end

  def current_order
    order = Order.find_or_create_by(user_id: current_user.id, status: 0)
  end
end
