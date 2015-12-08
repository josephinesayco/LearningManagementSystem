class Questionnaire < ActiveRecord::Base

  TAGS = {
    1 => "Integer and Floating Data Types",
    2 => "Character and Boolean Datatypes of Java Programming Language",
    3 => "Literals & variables of Java Programming Language",
    4 => "Array Data Structure of Java Programming Language",
    5 => "Arithmetic Operators",
    6 => "Java Questions & Answers – Bitwise Operators",
    7 => "Relational Operators and Boolean Logic Operators",
    8 => "Assignment Operators and Operator Precedence",
    9 => "Control Statements",
    10 => "Class Fundamentals & Declaring objects",
    11 => "Introduction to Methods",
    12 => "Access Control",
    13 => "String Class",
    14 => "Inheritance",
  }
  has_many :questionnaire_items

  ['a', 'b', 'c', 'd'].each_with_index do |var, ind|
    define_method var do
      self.questionnaire_items[ind].update_attribute(:is_answer, true)
    end
  end


  def answer
    item = questionnaire_items.where(is_answer: true).first
    item ? item.id : ""
  end
end