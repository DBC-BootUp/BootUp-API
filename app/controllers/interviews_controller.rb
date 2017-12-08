class InterviewsController < ApplicationController
  before_action :authorize

  def index
    interviews = Interview.includes(:skills, :interviewee, :company)
    render json: interviews.map(&:json_with_associations)
  end

  def show
    interview = Interview.find_by(id: params[:id])
    if interview
      render json: interview.json_with_associations
    else
      render json: []
    end
  end

  def create
    if !logged_in?
      render json: {error: "Not logged in", message: "Must be logged in to report on an interview"}, status: 403 
    else
      interview = Interview.new(interview_params)
      interview.interviewee = current_user
      interview.company = Company.find_or_create_by(name: params[:interview][:company]) do |company|
        company.name = params[:interview][:company]
      end


      if interview.save
        render json: interview.json_with_associations
      else
        p interview.errors.full_messages
        render json: {errors: interview.errors.full_messages}, status: 422
      end
    end

  end

  def update
    interview = Interview.find_by(id: params[:id])
    if interview.update(interview_params)
      render json: interview.json_with_associations
    else
      render json: {errors: interview.errors.full_messages}, status: 422
    end
  end

  def destroy
    interview = Interview.find_by(id: params[:id])
    interview.destroy
    render json: {message: "Interview destroyed"}
  end

  private
  def interview_params
    params.require(:interview).permit(:job_title, :referred, :received_offer, :notes, :difficulty_rating, :experience_rating, :accepted_offer, :phone_screen, :phone_screen_details, :tech_screen, :tech_screen_details, :take_home_challenge, :take_home_challenge_details, :onsite, :onsite_details, :whiteboarding, :whiteboarding_details, :negotiation_details, :company_id)
  end
end
