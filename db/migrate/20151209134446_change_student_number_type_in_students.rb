class ChangeStudentNumberTypeInStudents < ActiveRecord::Migration
  def change
    change_column :students, :student_number, :string
  end
end
