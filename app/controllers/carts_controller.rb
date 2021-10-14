class CartsController < ApplicationController


  # GET /carts/1 or /carts/1.json
  def show
    @order = current_order
  end

  # GET /carts/new


  # GET /carts/1/edit
  def edit
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
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
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
