class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :get_item, only: [:show, :edit, :update, :destroy]
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
 end

 def edit
 end

 def update
   if @item.update(item_params)
    redirect_to action: :show
   else
    render "edit"
   end
 end

 def destroy
  @item.destroy
  redirect_to action: :index
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

  def get_item
    @item = Item.find(params[:id])
  end
end
