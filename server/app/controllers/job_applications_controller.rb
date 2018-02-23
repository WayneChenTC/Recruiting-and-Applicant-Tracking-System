class JobApplicationsController < ApplicationController
    before_action :find_job

    def index
      @applications = @job.applications
    end

    def show
      @application = @job.applications.find( params[:id] )
    end

    def new
      @application = @job.applications.build
    end

    def create
      @application = @job.applications.build( application_params )
      @application.user_id = current_user.id
      if @application.save
          redirect_to company_job_applications_url(@job.company, @job )
      else
        render :action => :new
      end
    end

    def edit
      @application = @job.applications.find( params[:id] )
    end

    def update
      @application = @job.applications.find( params[:id] )

      if @application.update( application_params )
          redirect_to company_job_applications_url( @job.company, @job )
      else
        render :action => :edit
      end

    end

    def destroy
      @application = @job.applications.find( params[:id] )
      @application.destroy

      redirect_to company_job_applications_url( @job.company, @job )
    end

    protected

    def find_job
      @job = Job.find( params[:job_id] )
    end

    def application_params
        params.require(:application).permit(:cur_company, :linkedin_url, :portfolio_url, :add_info, :gender, :race, :veteran_stat, :disability_stat, :status)
    end
end
