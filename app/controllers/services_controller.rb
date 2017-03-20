class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all

    render json: @services
  end

  # GET /services/1
  # GET /services/1.json
  def show
    render json: @service
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    if @service.save
      render json: @service, status: :created, location: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    @service = Service.find(params[:id])

    if @service.update(service_params)
      head :no_content
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy

    head :no_content
  end

  private

    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name)
    end
end
