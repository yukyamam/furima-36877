class OrdersController < ApplicationController
  before_action :authenticate_user!#, except: :index
  before_action :get_one_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_by_card
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def get_one_item
    @item = Item.find(params[:item_id])
  end

  def pay_by_card
    price = @item.price
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自分のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: price,                         # 商品の値段
      card: order_address_params[:token],    # カードトークン
      currency: 'jpy'                        # 通貨の種類（日本円）
    )
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order
      redirect_to root_path
    end
  end

end
