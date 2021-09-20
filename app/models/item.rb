class Item < ApplicationRecord
  validates :item_name,          presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :delivery_fee_id,    presence: true
  validates :prefecture_id,      presence: true
  validates :scheduled_delivery, presence: true
  validates :price,              presence: true

  belongs_to :user
  has_one_attached :image
end
