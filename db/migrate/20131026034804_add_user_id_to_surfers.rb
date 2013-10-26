class AddUserIdToSurfers < ActiveRecord::Migration
  def change
    add_column :surfers, :user_id, :integer
  end
end
