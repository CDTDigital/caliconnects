class Campaign < ApplicationRecord
  has_many :alerts, dependent: :destroy
end
