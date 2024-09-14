class Office < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :active, presence: true
end
