class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.where(:company => Company.find(params[:company_id]));
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    if !logged_in?
      redirect_to login_path
    end
    if current_user.role == 'recruiter' and current_user.company_id == params[:company_id]
      @job = Job.new
    else
      redirect_to company_jobs_path(params[:company_id])
    end
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    if logged_in? and (current_user.role == 'admin' or current_user.role == 'recruiter')
    @job = Job.new(job_params)
    @job.company = Company.find(params[:company_id])
    @job.user_id = current_user.id
    respond_to do |format|
      if @job.save
        format.html { redirect_to company_job_path(@job.company, @job),
                      notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if logged_in? and (current_user.role == 'admin' or current_user.role == 'recruiter')
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to company_job_path(@job.company, @job),
                      notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    if logged_in? and (current_user.role == 'admin' or current_user.role == 'recruiter')
      @job.destroy
      respond_to do |format|
        format.html { redirect_to company_jobs_path,
                      notice: 'Job was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def search
    if params[:terms] and params[:terms] != ""
      @jobs = Job.joins('INNER JOIN companies ON jobs.company_id = companies.id').
                  where('companies.name LIKE ? OR companies.industry LIKE ? OR companies.size LIKE ? OR companies.headquarters LIKE ?',
                     params[:terms], params[:terms], params[:terms], params[:terms])

    else
      @jobs = Job.all
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @company = Company.find(params[:company_id])
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:company, :job_description, :employment_type, :responsibilities, :requirements, :terms)
    end
end
