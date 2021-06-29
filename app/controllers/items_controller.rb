class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :item_security, only: [:edit, :update]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

  def item_security
    redirect_to root_path if current_user.id != @item.user_id || @item.buyer.present?
  end

  def item_params
    # [memo] 1枚投稿時
    # params.require(:item).permit(:title, :description, :category_id, :status_id, :delivery_fee_id,
    #                              :prefecture_id, :days_of_ship_id, :price, :image).merge(user_id: current_user.id)
    params.require(:item).permit(:title, :description, :category_id, :status_id, :delivery_fee_id,
                                 :prefecture_id, :days_of_ship_id, :price, images: []).merge(user_id: current_user.id)
  end
end
