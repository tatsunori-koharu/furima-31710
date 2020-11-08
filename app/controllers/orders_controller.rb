class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :move_to_index
  def index
    # binding.pry
    @order = Order.new
    @item = Item.find(params[:item_id])
    # @user = User.find(params[:user_id])
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefectures_id, :municipality, :address, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  # def move_to_index
  #   binding.pry
  #   if current_user.id == @item.user_id
  #     render :root_path
  #   end
  # end
end


