class DropCategoryFromCampaignsAndAddName < ActiveRecord::Migration[5.0]
  def change
    remove_column :campaigns, :category, :string
    add_column :campaigns, :name, :string, default: ""
  end
end
