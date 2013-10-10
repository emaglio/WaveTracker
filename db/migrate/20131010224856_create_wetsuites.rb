class CreateWetsuites < ActiveRecord::Migration
  def change
    create_table :wetsuites do |t|

      t.timestamps
    end
  end
end
