class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
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
    @item = Item.find(params[:id])
   if @item.update(item_params)
    redirect_to action: :show
   else
    render "edit"
   end
 end


  private
  def item_params
    params.require(:item).permit(:title, :price, :category_id, :condition_id, :delivery_fee_id, :scheduled_delivery_id, :prefecture_id, :description, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == Item.find(params[:id]).user_id
      redirect_to action: :index
    end
  end
end
