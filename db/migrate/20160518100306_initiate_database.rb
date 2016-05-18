class InitiateDatabase < ActiveRecord::Migration
  
  def change
    
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :birth_date
      t.string :location
      t.string :gender
      t.string :email
      t.string :password
      t.string :confirm_password
      t.timestamps
    end

    create_table :surfers do |t|
      t.string :nickname
      t.string :home_spot
      t.string :stand
      t.string :style
      t.string :best_trick
      t.timestamps
    end
  
  end
end