class OrderAddress
  include ActiveModel::Model
  attr_accessor :order_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :building
    validates :phone_number
    validates :order_id
    validates :user_id
    validates :item_id
  end
 
  def save
    order = Order.create(user: user, item: item)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
  
end