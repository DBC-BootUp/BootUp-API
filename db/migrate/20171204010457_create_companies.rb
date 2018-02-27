class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.string :website
      t.string :tech_field
      t.boolean :has_apprenticeship

      t.timestamps
    end
  end
end
