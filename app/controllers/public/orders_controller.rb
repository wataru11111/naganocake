class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirmation
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.delivery_charge = 800
    @total = @cart_items.sum(&:subtotal) + @order.delivery_charge
 if params[:order][:shipping_option] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
 end

  end

  def completion
  end

   def create
  @order = Order.new(order_params)
  @order.customer_id = current_customer.id
   if @order.save
    current_customer.cart_items.each do |cart_item|
      @order_product = OrderProduct.new
      @order_product.order_id = @order.id
      @order_product.item_id = cart_item.item.id
      @order_product.purchase_price = cart_item.item. with_tax_price
      @order_product.quantity = cart_item.amount
      @order_product.save
      cart_item.destroy
    end
   redirect_to orders_completion_path
   else
    redirect_to orders_confirmation_path(@cart_item.id)
   end
   end



  def index
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.sum(&:subtotal) + @order.delivery_charge
  end

  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items.all
    @order.delivery_charge = 800
    @total = @cart_items.sum(&:subtotal) + @order.delivery_charge
  end
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment, :delivery_charge, :method_of_payment)
  end
end

