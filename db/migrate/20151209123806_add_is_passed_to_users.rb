class AddIsPassedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_passed, :boolean
  end
end
