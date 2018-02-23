before_action :find_user

def index
  @jobs = @user.jobs
end

def show
  @job = @user.jobs.find( params[:id] )
end

def new
  @job = @user.jobs.build
end

def create
  @job = @user.jobs.build( job_params )
  if @job.save
    redirect_to user_jobs_url( @user )
  else
    render :action => :new
  end
end

def edit
  @job = @user.jobs.find( params[:id] )
end

def update
  @job = @user.jobs.find( params[:id] )

  if @job.update( job_params )
    redirect_to user_jobs_url( @user )
  else
    render :action => :edit
  end

end

def destroy
  @job = @user.jobs.find( params[:id] )
  @job.destroy

  redirect_to user_jobs_url( @user )
end

protected

def find_user
  @user = User.find( params[:user_id] )
end

def job_params
	params.require(:job).permit(:company, :job_description, :employment_type, :responsibilities, :requirements, :terms)
end
