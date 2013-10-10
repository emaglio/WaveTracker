class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :myname, :surname, :birthdate, :location, :gender, :email, :password
      
      t.timestamps
    end
  end
end
