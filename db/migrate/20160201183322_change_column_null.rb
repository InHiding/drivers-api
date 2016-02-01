class ChangeColumnNull < ActiveRecord::Migration
  def change
    change_column_null :driver_positions, :driver_id, false
  end
end
