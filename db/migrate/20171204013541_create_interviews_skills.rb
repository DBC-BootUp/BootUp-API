class CreateInterviewsSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews_skills do |t|
      t.references :skill
      t.references :interview
    end
  end
end
