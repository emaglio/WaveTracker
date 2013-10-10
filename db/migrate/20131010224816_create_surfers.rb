class CreateSurfers < ActiveRecord::Migration
  def change
    create_table :surfers do |t|

      t.timestamps
    end
  end
end
