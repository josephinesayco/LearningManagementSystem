class AddLmsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :act_ref, :string
    add_column :students, :sent_int, :string
    add_column :students, :vis_vrb, :string
    add_column :students, :seq_glo, :string
  end
end
