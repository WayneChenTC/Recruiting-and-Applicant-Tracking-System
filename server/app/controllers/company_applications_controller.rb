class CompanyApplicationsController < ApplicationController
    before_action :find_company
    def index
        @applications = @company.applications
    end

    def show
        @application = @company.applications.find(params[:id])
    end

    def new
        @application = @company.applications.build
    end

    def create 
        @application = @company.applications.build(application_params)
        if @application.save
            redirect_to company_applications_url(@company)
        else
            render :action => :new
        end
    end

    def edit
        @application = @company.applications.find(params[:id])
    end

    def update
        @application = @company.applications.find(params[:id])

        if @application.update(application_params)
             redirect_to company_applications_url(@company)
        else
            render :action => :edit
        end
    end

    def destroy
        @application = @company.applications.find(params[:id])
        @application.destroy

        redirect_to company_applications_url(@company)
    end

    protected

    def find_company
        @company = Company.find(params[:company_id])
    end

    def application_params
        params.require(:application).permit(:name)
    end
end
