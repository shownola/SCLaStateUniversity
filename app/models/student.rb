class Student < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 250},
              uniqueness: {case_sensitive: false},
              format: {with: VALID_EMAIL_REGEX}

  has_secure_password
  has_many :courses
  has_many :student_courses
  has_many :courses, through: :student_courses



end
