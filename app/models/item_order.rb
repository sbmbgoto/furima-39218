class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :prefecture_id, :city, :addresses, :building, :phone_number, :post_code, :order_id
  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :addresses
    validates :phone_number,  length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true, message: "は10～11桁の半角数字で入力してください" }
    validates :post_code,     format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含めた半角数字で入力してください" }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end