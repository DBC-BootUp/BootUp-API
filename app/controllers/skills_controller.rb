class SkillsController < ApplicationController
  before_action :authorize

  def index
    render json: Skills.all
  end

  def create
    skill = Skill.new(skill_params)

    if skill.save
      render json: skill
    else
      render json: {errors: skill.errors.full_messages}, status: 422
    end
  end

  def destroy
    skill = Skill.find_by(id: params[:id])
    skill.destroy
    render json: {message: "Skill destroyed"}
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end
end
