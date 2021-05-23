class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
  validates :title
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with: /\A[0-9]+\z/}
  validates :description
  validates :image
    with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :condition_id
  validates :delivery_fee_id
  validates :prefecture_id
  validates :scheduled_delivery_id
    end
  end

  
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image
end
