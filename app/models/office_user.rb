class OfficeUser < ApplicationRecord
  belongs_to :user
  belongs_to :office

  validates :user_id, uniqueness: { scope: :office_id, message: "is already in the office" }
end
