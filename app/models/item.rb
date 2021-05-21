class Item < ApplicationRecord
  extending ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :Prefecture
  belongs_to :scheduled_delivery
end
