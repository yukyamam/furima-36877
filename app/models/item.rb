class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :item_name,             presence: true
  validates :description,           presence: true
  validates :category_id,           presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,          presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_fee_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,         presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                 presence: true
  # validates :image,               presence: true

  belongs_to :user
  has_one_attached :image

end
