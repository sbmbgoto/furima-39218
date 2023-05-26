class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_session, only: [:edit]
  before_action :set_item, only: [:show, :edit, :update ]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :expected_shipping_date_id, :price, :introduction, :image).merge(user_id: current_user.id)
  end

  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end