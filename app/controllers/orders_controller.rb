class OrdersController < ApplicationController
  before_action :authenticate_user! 
  before_action :move_to_index
  before_action :get_item
  
  def index
    @order_address = OrderAddress.new
  end

  def create
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def move_to_index
    if current_user.id == Item.find(params[:item_id]).user.id || Item.find(params[:item_id]).order.present? == true
      redirect_to root_path
    end
  end

  def get_item
    @item = Item.find(params[:item_id])
  end
end
