class AddCompletedRegistrationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :completed_registration, :boolean
  end
end
