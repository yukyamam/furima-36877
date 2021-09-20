class ItemsController < ApplicationController

  def index
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :delivery_fee_id, :prefecture_id. :scheduled_delivery, :price).merge(user_id: current_user.id)
  end
end
