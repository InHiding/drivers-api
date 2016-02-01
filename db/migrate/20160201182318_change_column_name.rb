class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :driver_positions, :latitute, :latitude
  end
end
