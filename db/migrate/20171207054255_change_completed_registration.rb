class ChangeCompletedRegistration < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :completed_registration, :boolean, :default => false
  end
end
