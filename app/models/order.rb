class Order < ApplicationRecord
  attr_accessor :token

  belongs_to :user
  has_one :shipping
  belongs_to :item
end
