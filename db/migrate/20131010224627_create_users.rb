class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :myname
	  t.string :surname
	  t.string :birth_date
	  t.string :location
	  t.string :gender
	  t.string :email
	  t.string :password
      t.timestamps
    end
  end
end