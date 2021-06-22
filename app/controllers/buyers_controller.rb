class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    # else current_user.id != @item.user_id ||
    #   redirect_to root_path

    # ログイン状態の場合は、自身が出品していない販売中商品の商品購入ページに遷移できること。
    # ログイン状態の場合でも、自身が出品していない売却済み商品の商品購入ページへ遷移しようとすると、トップページに遷移すること。
    # ログイン状態の場合でも、自身が出品した商品の商品購入ページに遷移しようとすると、商品の販売状況に関わらずトップページに遷移すること。

    end
    @buyer_order = BuyerOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_order = BuyerOrder.new(buyer_params)
    if @buyer_order.valid?
      @buyer_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_order).permit(:postal_code, :prefecture_id, :city_name, :house_num, :phone_num).merge(user_id: current_user.id)
  end

end
