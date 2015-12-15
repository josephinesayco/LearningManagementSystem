class CreateJavaTimers < ActiveRecord::Migration
  def change
    create_table :java_timers do |t|
      t.integer :student_id
      t.datetime :start_at
      t.boolean :lock
      t.boolean :extended
      t.boolean :finished
    end
  end
end
