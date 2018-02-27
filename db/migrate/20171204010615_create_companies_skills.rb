class CreateCompaniesSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :companies_skills do |t|
      t.references :company
      t.references :skill
    end
  end
end
