class AddUniqueIndexToOfficeUsers < ActiveRecord::Migration[7.2]
  def change
    add_index :office_users, [:user_id, :office_id], unique: true
  end
end
