class ApplicationsController < ApplicationController
    def new
        @application = Application.new
    end
    def create
        @application = Application.new(application_params)
        @application.save

        redirect_to :action => :index
    end
    def index
        @applications = Application.all
    end
    def show
        @application = Application.find(params[:id])
    end
    def edit
        @application = Application.find(params[:id])
    end
    def update 
        @application = Application.find(params[:id])
        @application.update(event_params)

        redirect_to :action => :show, :id => @application
    end
    def destroy
        @application = Application.find(params[:id])
        @application.destroy

        redirect_to :action => :index
    end
    def upload
    end
    
    private
    
    def application_params
        params.require(:event).permit(:app_id, :user_id, :cur_company, :linkedin_url, :portfolio_url, :add_info, :gender, :race, :veteran_stat, :disability_stat)
    end
end
