class CreateDriverPositions < ActiveRecord::Migration
  def change
    create_table :driver_positions do |t|
      t.decimal :latitute
      t.decimal :longitude
      t.boolean :driver_available
      t.references :driver, index: {:unique=>true}, foreign_key: true

      t.timestamps null: false
    end
  end
end
