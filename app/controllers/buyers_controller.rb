class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])

    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.buyer.present?
      redirect_to root_path
    end

    @buyer_order = BuyerOrder.new
  end

  def create
    @item = Item.find(params[:item_id])

    @buyer_order = BuyerOrder.new(buyer_params)

    if @buyer_order.valid?

      pay_item

      @buyer_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_order).permit(:postal_code, :prefecture_id, :city_name, :house_num, :building_name, :phone_num).merge(user_id: current_user.id, token: params[:token], item_id: @item.id, price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # Payjp.api_key = "sk_test_9089098402f38e481a90e996"
    Payjp::Charge.create(
      amount: buyer_params[:price], 
      card: buyer_params[:token], 
      currency: 'jpy'
    )
  end

end
