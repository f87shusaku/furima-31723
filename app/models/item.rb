class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_comment
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefectures_id
    validates :days_to_ship_id
    validates :price
  end

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefectures_id
    validates :days_to_ship_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :days_to_ship

  belongs_to :user
  has_one :purchase
  has_one_attached :image
end
