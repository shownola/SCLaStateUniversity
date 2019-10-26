class Course < ApplicationRecord
  validates :name, :short_name, presence: true, length: {minimum: 5, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 300}
  has_many :student_courses
  has_many :students, through: :student_courses



end
