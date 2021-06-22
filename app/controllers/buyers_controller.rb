class BuyersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
  end

  def new
    @buyer_order = BuyerOder.new
  end

  def create
    @buyer_order = BuyerOder.new(buyer_params)
    if @buyer_order.valid?
      @buyer_order.save
      redirect_to root_path
    else
      render :index
  end

  private

  def buyer_params
    params.require(:buyer_order).permit(:postal_code, :prefecture_id, :city_name, :house_num, :phone_num).merge(user_id: current_user.id)
  end

end
