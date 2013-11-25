class AddPasswordConfirmToUser < ActiveRecord::Migration
  def change
    add_column :users, :password_confirm, :string
  end
end
