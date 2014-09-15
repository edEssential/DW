class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def bring_in_models
      @projects = Project.all
      @services = Service.all
  end
  
end