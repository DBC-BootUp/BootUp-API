class CompaniesController < ApplicationController
  def index
    companies = Company.all
    render json: companies
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: company
    else
      render json: {errors: company.errors.full_messages}, statue: 422
    end
  end

  def show
    company = Company.includes(:interviews, :skills, :interviewees).find_by_id(params[:id])

    render json: company.json_with_association
  end

  def update
    company = Company.find_by(params[:id])
    if company.update(company_params)
      render json: company
    else
      render json: {errors: company.errors.full_messages}, statue: 422
    end
  end

  def destroy
    company = Company.find_by(id: params[:id])
    company.destroy
    render json: {message: "Company destroyed"}
  end

  private
  def company_params
    params.require(:company).permit(:name, :location, :website, :tech_field, :has_apprenticeship)
  end
end
