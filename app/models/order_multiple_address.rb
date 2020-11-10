class OrderMultipleAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :municipalities, :address, :building, :phone_number, :prefecture_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Must be within 11 digits' }
    validates :prefecture_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    MultipleAddress.create(postal_code: postal_code, municipalities: municipalities, address: address, building: building, phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)
  end
end
