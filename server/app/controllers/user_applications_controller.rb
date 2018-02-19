class UserApplicationsController < ApplicationController
    before_action :find_user

    def index
      @applications = @user.applications
    end

    def show
      @application = @user.applications.find( params[:id] )
    end

    def new
      @application = @user.applications.build
    end

    def create
      @application = @user.applications.build( application_params )
      if @application.save
        redirect_to user_applications_url( @user )
      else
        render :action => :new
      end
    end

    def edit
      @application = @user.applications.find( params[:id] )
    end

    def update
      @application = @user.applications.find( params[:id] )

      if @application.update( application_params )
        redirect_to user_applications_url( @user )
      else
        render :action => :edit
      end

    end

    def destroy
      @application = @user.applications.find( params[:id] )
      @application.destroy

      redirect_to user_applications_url( @user )
    end

    protected

    def find_user
      @user = User.find( params[:user_id] )
    end

    def application_params
        params.require(:application).permit(:name)
    end
end
