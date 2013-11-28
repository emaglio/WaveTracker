class AddRememberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember, :integer
  end
end
