class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_one_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def get_one_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end