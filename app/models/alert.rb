class Alert < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :Alert do
    property :id do
      key :type, :integer
      key :format, :int64
    end
    property :campaign_id do
      key :type, :integer
      key :format, :int64
    end

    property :description do
      key :type, :string
    end

    property :severity do
      key :type, :string
    end

    property :created_at do
      key :type, :string
    end

    property :updated_at do
      key :type, :string
    end
  end

  belongs_to :campaign

  def self.severities
    [:advisory, :voluntary_evacuation, :mandatory_evacuation]
  end
end
