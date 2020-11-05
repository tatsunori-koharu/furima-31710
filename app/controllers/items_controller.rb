class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :status_id, :shipping_fee_id, :shipping_area_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  
end
