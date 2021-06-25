class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :item_security, only: [:index, :create]

  def index
    @buyer_order = BuyerOrder.new
  end

  def create
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
    params.require(:buyer_order).permit(:postal_code, :prefecture_id, :city_name, :house_num, :building_name, :phone_num).merge(
      user_id: current_user.id, token: params[:token], item_id: @item.id, price: @item.price
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def item_security
    redirect_to root_path if current_user.id == @item.user_id || @item.buyer.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: buyer_params[:price],
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end
