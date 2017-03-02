class ApidocsController < ApplicationController
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'California Connects Alerts System'
      key :description, 'Provides emergency and non-emergency alerts to California Residents'
      contact do
        key :name, 'the IBM Bluemix Garage'
      end
      license do
        key :name, 'MIT'
      end
    end
    tag do
      key :name, 'swagger'
      key :description, 'shiny fawn operations'
    end
    key :basePath, '/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
    AlertsController,
    Alert,
    self
  ].freeze

  def index
    @swagger_object = Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    respond_to do |format|
      format.html
      format.json { render json: @swagger_object}
    end
  end
end
