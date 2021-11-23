class CartsController < ApplicationController
  before_action :set_cart, only: %i[ destroy  ]

  # GET /carts/1 or /carts/1.json
  def show
    @order = current_order
  end

  # POST /carts or /carts.json

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    product_id = params[:cart][:product_id]
    quantity = params[:cart][:quantity]

    current_order.add_product(product_id, quantity)
    redirect_to root_path, notice: 'Product added successfully'
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.order.total = @cart.update_order
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to cart_url, notice: "Your cart is now updated" }
      format.json { head :no_content }
    end
  end

  def pay_with_paypal
    order = Order.find(params[:cart][:order_id])
    price = order.total
    response = EXPRESS_GATEWAY.setup_purchase(price, ip: request.remote_ip,
    return_url: process_paypal_payment_cart_url,
    cancel_return_url: root_url,
    allow_guest_checkout: true,
    currency: 'USD' )
    payment_method = PaymentMethod.find_by(code: 'PEC')
    Payment.create(
    order_id: order.id, payment_method_id: payment_method.id, status: "processing",
    total: order.total,
    token: response.token
    )
    
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def process_paypal_payment
    details = EXPRESS_GATEWAY.details_for(params[:token])
    express_purchase_options =
    {
      ip: request.remote_ip, token: params[:token],
      payer_id: details.payer_id,
      currency: "USD"
    }
    price = details.params["order_total"].to_d
    response = EXPRESS_GATEWAY.purchase(price, express_purchase_options)
      if response.success?
        payment = Payment.find_by(token: response.token)
        order = payment.order
        payment.status = 'completed'
        order.status = 'completed'
          ActiveRecord::Base.transaction do
            order.save!
            payment.save!
            UserNotifierMailer.send_signup_email(order.user, order).deliver
          end
        flash[:success] = "Tu compra ha sido comppletada"
        redirect_to root_path
      else
        redirect_to root_path, notice: 'Hemos tenido problemas para procesar tu pago'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:quantity, :order_id, :product_id)
    end
end
