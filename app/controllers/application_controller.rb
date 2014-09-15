class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def bring_in_models
      @projects = Project.order("id DESC")
      @services = Service.all
  end
  
end