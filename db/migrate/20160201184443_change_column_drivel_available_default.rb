class ChangeColumnDrivelAvailableDefault < ActiveRecord::Migration
  def change
    change_column_default :driver_positions, :driver_available, false
  end
end
