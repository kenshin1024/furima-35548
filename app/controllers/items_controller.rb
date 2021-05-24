class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render "new"
  end
end

 def show
    @item = Item.find(params[:id])
 end

 def edit
    @item = Item.find(params[:id])
 end

 def update
   @item = Item.new(item_params)
   if @item.save
    redirect_to action: :show
   else
    render "new"
 end


  private
  def item_params
    params.require(:item).permit(:title, :price, :category_id, :condition_id, :delivery_fee_id, :scheduled_delivery_id, :prefecture_id, :description, :image).merge(user_id: current_user.id)
  end
end
