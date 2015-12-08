class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username, :type]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ALLOWED_AGE = {
  	"< 16" => "15",
  	"16"   => "16",
  	"17"   => "17",
  	"18"   => "18",
  	"19"   => "19",
  	"20"   => "20",
  	"21"   => "21",
  	"> 21" => "22",
  }
  COURSES = {
  	"Computer Science" => "CS",
  	"Computer Technology" => "CT",
  	"Information Technology"  => "IT"
  }

  YR_LEVEL = {
  	"1st" => "1",
  	"2nd" => "2",
  	"3rd" => "3",
  	"4th" => "4"
  }

  SECTION = ["A", "B", "C", "D", "E", "F", "G", "H"]

  SCHEDULE = {
  	"07:00 - 12:00" => "am",
  	"12:00 - 05:00" => "pm",
  	"05:00 - 08:00" => "night"
  }

  GENDER = ["Female", "Male"]


  scope :student, ->(){ where(type: "User") }

  validates :student_number, uniqueness: true, presence: true
  validates :username, presence: true
  validate :student_list?

	def email_required?
		false
	end

	def email_changed?
	 	false
	end

  private
  def student_list?
    sn = self.student_number.to_i
    is_included = Student.pluck(:student_number).include?(self.student_number.try(:to_i))

    if(!is_included && self.type == "User")
      errors.add(:base, "Not in the list of students.") unless is_included
    end
  end
end
