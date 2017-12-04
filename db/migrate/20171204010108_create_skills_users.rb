class CreateSkillsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :skills_users do |t|
      t.references :user
      t.references :skill
    end
  end
end
