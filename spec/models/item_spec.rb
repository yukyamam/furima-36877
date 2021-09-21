require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の出品" do
    it "商品画像が空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank", )
    end
    it "商品名が空では登録できない" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it "商品説明が空では登録できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "カテゴリーが空では登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category can't be blank")
    end
    it "商品状態が空では登録できない" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition can't be blank")
    end
    it "送料の負担が空では登録できない" do
      @item.delivery_fee_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee can't be blank")
    end
    it "発送元の地域が空では登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank")
    end
    it "発送までの日数が空では登録できない" do
      @item.scheduled_delivery_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", "Scheduled delivery can't be blank")
    end
    it "価格が空では登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格が¥300~¥9,999,999の間でなければ登録できない" do
      @item.price = "200" #@item.price = "10000000"
      @item.valid?
      if @item.price < 300
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      else
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
    it "価格が半角数値でなければ登録できない" do
      @item.price = "１５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
