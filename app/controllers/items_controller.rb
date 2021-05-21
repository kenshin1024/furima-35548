class ItemsController < ApplicationController
  before_action :authenticate_user!, if: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to :index
    else
      @item = Item.new
      render :new
  end
end

  private
  def item_params
    params.require(:item).permit(:title, :price, :user, :category_id, :condition_id, :delivery_fee_id, :scheduled_delivery_id, :prefecture_id, :description)
  end
end
