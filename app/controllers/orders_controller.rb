class OrdersController < ApplicationController
  before_action :authenticate_user! 
  before_action :move_to_index
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
     @order_address.save
     redirect_to root_path
    else
    render :index
    end                               
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, token: params[:token],item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_a056b1db981327eb02936c84"
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def move_to_index
    if current_user.id == Item.find(params[:id]).user.id
      redirect_to root_path
    end
  end
end
