class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :family_name
    validates :first_name_k
    validates :family_name_k
    validates :birth_day
  end

  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/.freeze }
  validates :first_name, :family_name,
            format: { with: /\A[\p{Han}\p{Hiragana}\p{katakana}]+\z/, allow_blank: true }
  validates :first_name_k, :family_name_k,
            format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }

  has_many :items
  has_many :orders
  has_many :multiple_address
end
