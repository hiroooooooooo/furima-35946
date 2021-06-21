class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_find, only: [:show, :edit, :update]
  before_action :edit_secure, only: [:edit, :update]

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
    # @item = Item.find(params[:id])
  end

  def edit
    # @item = Item.find(params[:id])
    # redirect_to root_path if current_user.id != @item.user_id
  end

  def update
    # @item = Item.find(params[:id])
    # redirect_to root_path if current_user.id != @item.user_id
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render 'edit'
    end
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

  def edit_secure
    redirect_to root_path if current_user.id != @item.user_id
  end

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :delivery_fee_id,
                                 :prefecture_id, :days_of_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
