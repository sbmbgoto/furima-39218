class Item < ApplicationRecord
  validates :name,                       presence: true
  validates :category_id,                numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,               numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_burden_id,         numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,              numericality: { other_than: 1 , message: "can't be blank"}
  validates :introduction,               presence: true
  validates :expected_shipping_date_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                      presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
  validates :image,                      presence: true

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_burden
  belongs_to :prefecture
  belongs_to :expected_shipping_date


  has_one_attached :image
end
