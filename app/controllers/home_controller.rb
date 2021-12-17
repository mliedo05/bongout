class HomeController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")
    if current_user
      @order = Order.find_by(user_id: current_user.id)
    end
    @products = Kaminari.paginate_array(@products).page(params[:page]).per(5)
  end

end
