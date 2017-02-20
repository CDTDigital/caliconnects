class Alert < ApplicationRecord
  belongs_to :campaign

  def self.severities
    [:advisory, :voluntary_evacuation, :mandatory_evacuation]
  end
end
