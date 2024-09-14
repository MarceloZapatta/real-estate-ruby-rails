class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :active, presence: true
  has_many :office_users
  has_many :offices, through: :office_users
end
