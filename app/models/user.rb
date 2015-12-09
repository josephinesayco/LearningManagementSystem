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

  def status_passed?
    user = self
    if user.prog_2 <= 2.25
      if user.schedule == "am" || user.schedule == "pm"
        if user.prog_3 <= 1.75
          status = "passed"
        end
        if user.prog_3 > 1.75
          if user.prog_2 <= 1.753
            if user.prog_1 <= 2.5
              status = "passed"
            end
            if user.prog_1 > 2.5
              if user.age <= 18
                status = "passed"
              end
              if user.age > 18
                if user.prog_1 <= 3
                  status = "passed"
                end
                if user.prog_1 > 3
                  status = "failed"
                end
              end
            end
          end
          if user.prog_2 > 1.753
            if user.prog_1 <= 2
              if user.schedule == "am"
                status = "passed"
              else
                if user.age <= 19
                  if user.gender == "Female"
                    status = "passed"
                  else
                    status = "failed"
                  end
                else
                  status = "passed"
                end
              end
            end
            if user.prog_1 > 2
              if user.prog_2 <= 2
                if user.prog_3 <= 2.75
                  if user.schedule == "am"
                    status = "passed"
                  else
                    status = "failed"
                  end
                end
                if user.prog_3 > 2.75
                  status = "failed"
                end
              end
              if user.prog_2 > 2
                status = "failed"
              end
            end
          end
        end
      end
      if user.schedule == "night"
        if user.prog_3 <= 2.25
          # Not prog 2???
          if user.prog_3 <= 1.5
            status = "passed"
          else
            if user.age <= 18
              status = "passed"
            else
              if user.prog_1 <= 1.753
                status = "passed"
              else
                if user.prog_2 <= 1.75
                  status = "passed"
                else
                  status = "failed"
                end
              end
            end
          end
        end
        if user.prog_3 > 2.25
          if user.prog_2 <= 1.753
            # prog 2 again?
            if user.prog_2 <= 1.253
              status = "passed"
            else
              status = "failed"
            end
          else
            status = "failed"
          end
        end
      end
    else#prog_2 > 2.25
      if user.prog_3 <= 1.75
        if user.prog_1 <= 2.25
          status = "passed"
        else
          if user.prog_1 <= 3
            status = "passed"
          else
            status = "failed"
          end
        end
      else
        if user.prog_1 <= 2
          if user.prog_3 <= 2.25
            status = "passed"
          else
            status = "failed"
          end
        else
          status = "failed"
        end
      end
    end

    status == "passed"
  end

  private
  def student_list?
    sn = self.student_number
    p sn
    p "ffFFFF"
    is_included = Student.pluck(:student_number).include?(sn)

    if(!is_included && self.type == "User")
      errors.add(:base, "Not in the list of students.") unless is_included
    end
  end
end
