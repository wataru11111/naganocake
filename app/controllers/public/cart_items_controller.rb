class Public::CartItemsController < ApplicationController

  def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id
   if @cart_item.save
   redirect_to cart_items_path
   else
    redirect_to item_path(@item.id)
   end

  end

  def index
  
    @cart_items = current_customer.cart_items.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

 def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
 end
end
