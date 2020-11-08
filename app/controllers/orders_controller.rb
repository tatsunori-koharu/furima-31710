class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :move_to_index
  def index
    # binding.pry
    @order = Order.new
    @item = Item.find(params[:item_id])
    # @user = User.find(params[:user_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
  end
  

  private
  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # def move_to_index
  #   binding.pry
  #   if current_user.id == @item.user_id
  #     render :root_path
  #   end
  # end
end


