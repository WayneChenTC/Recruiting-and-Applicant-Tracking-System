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
    if current_user.role != 'admin'
      redirect_to companies_path
    end
  end

  def destroy
    if logged_in? and current_user.role == 'admin'

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
    if !logged_in? or current_user.role != 'admin'
      redirect_to login_path
    else
      @company = Company.new(company_params)

      if @company.save
        redirect_to @company
      else
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
