class User < ApplicationRecord
  before_save { self.email = email.downcase}
  has_many :workouts, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitive: false}, length: {minimum:3, maximum:15}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false},length: {maximum:110}, format: { with: VALID_EMAIL_REGEX}
  has_secure_password #Might have to remove this unsure what doing
end
