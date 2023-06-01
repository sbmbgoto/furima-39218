class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token
  attr_accessor :prefecture_id, :city, :addresses, :building, :phone_number, :post_code, :order_id
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city,          presence: true
  validates :addresses,     presence: true
  validates :phone_number,  presence: true, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true, message: "は10～11桁の半角数字で入力してください" }
  validates :post_code,     presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含めた半角数字で入力してください" }
  validates :user_id,       presence: true
  validates :item_id,       presence: true
  validates :token,         presence: true


 def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Shipping.create(post_code: post_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
 end
end