class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.string :job_title
      t.boolean :referred
      t.boolean :received_offer
      t.text :notes
      t.integer :difficulty_rating
      t.integer :experience_rating
      t.boolean :accepted_offer
      t.boolean :phone_screen
      t.text :phone_screen_details
      t.boolean :tech_screen
      t.text :tech_screen_details
      t.boolean :take_home_challenge
      t.text :take_home_challenge_details
      t.boolean :onsite
      t.text :onsite_details
      t.boolean :whiteboarding
      t.text :whiteboarding_details
      t.text :negotiation_details
      t.references :user
      t.references :company

      t.timestamps
    end
  end
end
