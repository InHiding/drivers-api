class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :car_plate

      t.timestamps null: false
    end
  end
end
