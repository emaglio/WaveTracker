class CreateSurfers < ActiveRecord::Migration
  def change
    create_table :surfers do |t|
		t.string :nickname
		t.string :home_spot
		t.string :goofy_regular
		t.string :style
		t.string :best_trick
		t.timestamps
    end
	# add_index :surfers, :user_id
  end
end
