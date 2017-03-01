class AddReceivedTotalAndOpenedTotalToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :received_total, :integer, default: 0
    add_column :alerts, :opened_total, :integer, default: 0
  end
end
