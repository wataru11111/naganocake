class Public::CartItemsController < ApplicationController

  def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id
  @cart_items = current_customer.cart_items.all
  cart_item = @cart_items.find_by(item_id: params[:cart_item][:item_id])
  if cart_item
    new_amount = cart_item.amount + @cart_item.amount
    cart_item.update_attribute(:amount, new_amount)
    redirect_to cart_items_path
   else
     @cart_item.save
   redirect_to cart_items_path
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
