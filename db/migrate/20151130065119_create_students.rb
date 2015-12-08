class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :student_number
      t.string :fullname

      t.timestamps null: false
    end
  end
end
