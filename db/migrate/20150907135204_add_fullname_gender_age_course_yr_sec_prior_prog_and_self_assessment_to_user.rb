class AddFullnameGenderAgeCourseYrSecPriorProgAndSelfAssessmentToUser < ActiveRecord::Migration
  def change
    add_column :users, :student_number, :string, :null => false, :default => ""
    add_column :users, :username, :string, :null => false, :default => ""
    add_column :users, :fullname, :string, :null => false, :default => ""
    add_column :users, :gender, :string, :null => false, :default => ""
    add_column :users, :age, :integer
    add_column :users, :course, :integer
    add_column :users, :yr_level, :integer
    add_column :users, :section, :string
    add_column :users, :schedule, :string
    add_column :users, :prog_1, :double
    add_column :users, :prog_2, :double
    add_column :users, :prog_3, :double
  end
end
