class AddLockToStudents < ActiveRecord::Migration
  def change
    add_column :students, :lock, :boolean, default: false
  end
end
