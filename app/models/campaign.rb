class Campaign < ApplicationRecord
  has_many :alerts, dependent: :destroy

  def formatted_date
    Time.at(date).strftime("%A, %d %b %Y %H:%M %p")
  end

  def self.categories
    [:earthquake, :fire, :river_gauge, :tsunami, :weather, :other]
  end
end
