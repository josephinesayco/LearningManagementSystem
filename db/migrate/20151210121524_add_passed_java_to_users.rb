class AddPassedJavaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :passed_java, :boolean
  end
end
