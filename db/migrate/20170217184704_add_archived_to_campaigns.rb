class AddArchivedToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :archived, :boolean, default: false
  end
end
