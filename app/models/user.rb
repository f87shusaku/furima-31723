class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,      presence: true
  validates :first_name,    presence: true
  validates :family_name,   presence: true
  validates :first_name_k,  presence: true
  validates :family_name_k, presence: true
  validates :birth_day,     presence: true
  
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/.freeze }
  validates :first_name, :family_name,
    format: { with: /\A[\p{Han}\p{Hiragana}\p{katakana}]+\z/, allow_blank: true}
  validates :first_name_k, :family_name_k,
    format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true}
end
