class AddSeverityToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :severity, :string, default: "advisory"
  end
end
