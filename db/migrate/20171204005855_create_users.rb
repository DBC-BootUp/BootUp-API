class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :year
      t.string :cohort
      t.string :location
      t.string :email
      t.string :linkedin_url
      t.string :github_url
      t.string :facebook_url
      t.string :current_company
      t.string :current_position
      t.string :photo_url

      t.timestamps
    end
  end
end
