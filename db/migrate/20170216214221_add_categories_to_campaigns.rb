class AddCategoriesToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :category, :string
  end
end
