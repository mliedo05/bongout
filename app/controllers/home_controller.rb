class HomeController < ApplicationController
  def index
    @products = Product.all
    if current_user
      @order = Order.find_by(user_id: current_user.id)
    end
  end
end
