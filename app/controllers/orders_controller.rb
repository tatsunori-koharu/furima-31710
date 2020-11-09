class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :move_to_index
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render action: :index
    end
  end
  

  private
  def order_params
    params.permit(:postal_code, :prefectures_id, :municipality, :address, :building_number, 
      :phone_number, :item_id, :token).merge(user_id: current_user.id)
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


