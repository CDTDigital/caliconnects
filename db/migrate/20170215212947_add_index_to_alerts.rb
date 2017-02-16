class AddIndexToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_index :alerts, :campaign_id
  end
end
