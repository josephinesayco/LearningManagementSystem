class Student < ActiveRecord::Base
  belongs_to :teacher
  has_one :java_timer
  has_one :user, foreign_key: "student_number", primary_key: "student_number"

  # act/ref sent/int vis/vrb seq/glo
  # act_ref  = 0 or 1
  # sent_int = 0 or 1
  # vis_vrb  = 0 or 1
  # seq_glo  = 0 or 1
  ACT_REF  = 1
  SENT_INT = 2
  VIS_VRB = 3
  SEQ_GLO  = 4

  STUDENT_LMS = [
    ACT_REF, SENT_INT,  VIS_VRB, SEQ_GLO
  ]

  ILS_VALUE = {
    "act_ref" => {"a" => "active", "b" => "reflective" },
    "sent_int" => {"a" => "sensing", "b" => "intuitive" },
    "vis_vrb" => {"a" => "visual", "b" => "verbal" },
    "seq_glo" => {"a" => "sequential", "b" => "global" }
  }

  LMS_ATTR = {
    ACT_REF  => "act_ref",
    SENT_INT => "sent_int",
    VIS_VRB => "vis_vrb",
    SEQ_GLO  => "seq_glo"
  }

  validates :student_number, presence: true, uniqueness: true
  validates :fullname, presence: true
end
