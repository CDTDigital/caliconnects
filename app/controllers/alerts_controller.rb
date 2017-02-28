class AlertsController < ApplicationController
  include Swagger::Blocks

  swagger_path '/alerts' do
    operation :get do
      key :description, "Returns all alerts from system"
      key :operationId, "getAlerts"
      key :produces, [
          'application/json'
      ]
      key :tags, [
          'alerts'
      ]
      response 200 do
        key :description, 'alert response'
        schema do
          key :type, :array
          items do
            key :'$ref', :Alert
          end
        end
      end
    end
  end

  def index
    @alerts = Alert.all

    render json: @alerts
  end
end