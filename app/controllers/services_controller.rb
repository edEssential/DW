class ServicesController < ApplicationController
  before_filter :authenticate_user!

    def new
      @service = Service.new
    end

    def create
      @service = Service.create(params[:service])
      respond_to do |format|
        if @service.save
          format.html { redirect_to content_management_index_path }
        else
          format.html { redirect_to new_service_path, :notice => "Cannot create service without a title!" }
        end
      end
    end

    def show
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end

    def index
      @service = Service.all
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end

    def edit
      @service = Service.find(params[:id])
    end

    def update   
      @service = Service.find(params[:id])
      if @service.update_attributes(params[:service])
        respond_to do |format|
         format.html { redirect_to content_management_index_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @service = Service.find(params[:id])
      @service.destroy
      respond_to do |format|
        format.html { redirect_to content_management_index_path }
      end
    end
  
end