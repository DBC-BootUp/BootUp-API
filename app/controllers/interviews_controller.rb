class InterviewsController < ApplicationController
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
    @interview = Interview.new(interview_params)
    if @interview.save
      render json: @interview.json_with_associations
    else
      p @interview.errors.full_messages
      render json: {errors: @interview.errors.full_messages}, status: 422
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
    params.require(:interview).permit(:job_title, :referred, :received_offer, :notes, :difficulty_rating, :experience_rating, :accepted_offer, :phone_screen, :phone_screen_details, :tech_screen, :tech_screen_details, :take_home_challenge, :take_home_challenge_details, :onsite, :onsite_details, :whiteboarding, :whiteboarding_details, :negotiation_details, :user_id, :company_id)
  end
end
