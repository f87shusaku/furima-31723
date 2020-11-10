class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index, :create]
  def index
    @order_multiple_address = OrderMultipleAddress.new
    if @item.user.id == current_user.id
    redirect_to root_path 
    end
    if @item.order.present?
    redirect_to root_path
    end
  end

  def create
    @order_multiple_address = OrderMultipleAddress.new(order_params)
    if @order_multiple_address.valid?
      pay_card
      @order_multiple_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_multiple_address).permit(:postal_code, :municipalities, :address, :building, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_card
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
