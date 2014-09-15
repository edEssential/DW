class ProjectsController < ApplicationController
  before_filter :authenticate_user!

    def new
      @project = Project.new
    end

    def create
      @project = Project.create(params[:project])
      respond_to do |format|
        if @project.save
          format.html { redirect_to content_management_index_path }
        else
          format.html { redirect_to new_project_path, :notice => "Cannot create product without a title!" }
        end
      end
    end

    def show
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
    
    def project_show_via_ajax_call
      project = Project.find(params[:id])
      #next_project = project.next
      #next_project_id = next_project.map {|np| np.id}.join("")
      #prev_project = project.prev
      #prev_project_id = prev_project.map {|pp| pp.id}.join("")
      
      video = project.url
      project_show = { :id => project.id, :title => project.title, :client => project.client, :description => project.description, :video => video }
      render :json => project_show
    end

    def index
      @project = Project.all
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end

    def edit
      @project = Project.find(params[:id])
    end

    def update   
      @project = Project.find(params[:id])
      if @project.update_attributes(params[:project])
        respond_to do |format|
         format.html { redirect_to content_management_index_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      respond_to do |format|
        format.html { redirect_to content_management_index_path }
      end
    end
  
end