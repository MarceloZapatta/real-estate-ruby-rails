class Office < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :active, presence: true
  has_many :office_users
  has_many :users, through: :office_users
end
