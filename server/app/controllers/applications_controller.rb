class ApplicationsController < ApplicationController
    before_action :set_application, :only => [:show, :edit, :update, :destroy]
    def new
        @application = Application.new
    end
    def create
        @application = Application.new(application_params)
        if @application.save
            redirect_to applications_url
        else  
            render :action => :new
        end    
    end
    def index
        @applications = Application.page(params[:page]).per(5)
    end
    def show
    end
    def edit
    end
    def update 
        if @application.update(application_params)
            redirect_to application_url(@application)
        else 
            render :action => :edit
        end
    end
    def destroy
        @application.destroy

        redirect_to applications_url
    end
  
    
    private
    
    def application_params
        params.require(:application).permit(:applicant_id, :user_id_not_key, :cur_company, :linkedin_url, :portfolio_url, :add_info, :gender, :race, :veteran_stat, :disability_stat)
    end
    def set_application
        @application = Application.find(params[:id])
    end
end
