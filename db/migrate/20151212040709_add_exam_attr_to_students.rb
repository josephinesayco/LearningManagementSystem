class AddExamAttrToStudents < ActiveRecord::Migration
  def change
    add_column :students, :will_passed, :boolean
    Questionnaire::TAGS.keys.each do |num|
      add_column :students, "tag_#{num}".to_sym, :integer
    end
  end
end
