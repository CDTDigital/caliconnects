class ApidocsController < ApplicationController
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'swagger title'
      key :description, 'swagger description'
      contact do
        key :name, 'bluemix garage'
      end
      license do
        key :name, 'MIT'
      end
    end
    tag do
      key :name, 'swagger'
      key :description, 'shiny fawn operations'
    end
    key :basePath, '/api'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
    Admin::CampaignsController,
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
