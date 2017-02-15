class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.integer :campaign_id
      t.text :description

      t.timestamps
    end
  end
end
