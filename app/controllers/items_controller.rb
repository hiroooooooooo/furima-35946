class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def new
    @item = Item.new
  end
  
  def create
  end

  private

  def strong_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :delivery_fee_id, 
      :prefecture_id, :days_of_ship_id, :price, :image).marge(user_id: current_user.id)
  end

end
