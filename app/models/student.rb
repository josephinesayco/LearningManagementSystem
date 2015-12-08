class Student < ActiveRecord::Base
  belongs_to :teacher

  validates :student_number, presence: true, uniqueness: true
  validates :fullname, presence: true
end
