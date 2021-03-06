class CompaniesController < ApplicationController

  def index
    if !logged_in?
      redirect_to login_path
    else
      @companies = Company.all
    end
  end

  def show
    if !logged_in?
      redirect_to login_path
    else
      @company = Company.find(params[:id])
    end

  end

  def new
    if !logged_in?
      redirect_to login_path
    end
    if (current_company.role != 'admin' and current_company.role != 'recruiter')
      redirect_to companies_path
    end
  end

def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_path
    else
      puts @company.errors.full_messages
      render 'edit', alert: "Oops! There was a problem, please try again"
    end
  end


  def destroy
    if logged_in? and current_company.role == 'admin'

      Company.find(params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to companies_path,
                                  notice: 'Company was successfully destroyed.' }
        format.json { head :no_content }

      end

    else
      redirect_to login_path
    end

  end

  def create
    if !logged_in? or (current_company.role != 'admin' and current_company.role != 'recruiter')
      redirect_to login_path
    else
      @company = Company.new(company_params)

      if @company.save
        redirect_to @company
      else
        puts @company.errors.full_messages
        render :action => :new
      end
    end


  end

  private
  def company_params
    params.require(:company).permit(:name, :website, :headquarters, :size,
                                    :founded, :industry, :revenue, :synopsis)
  end
end
