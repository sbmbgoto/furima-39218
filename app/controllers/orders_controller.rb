class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_item, only: [:index,:create]
  def index
    @item_order = ItemOrder.new
    if current_user.id == @item.user_id || Order.find_by(item_id: @item.id)
      redirect_to root_path
    end
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:item_order).permit(:prefecture_id, :city, :addresses, :building, :phone_number, :post_code).merge(user_id: current_user.id, item_id: params[:item_id], order_id: params[:order_id], token: params[:token])
  end


   def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
       amount: Item.find(order_params[:item_id]).price,
       card: order_params[:token],
       currency: 'jpy'
     )
   end

   def set_item
    @item = Item.find(params[:item_id])
   end
end
