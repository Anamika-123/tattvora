class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX =  /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z\d\s]).{8,}\z/
  VALID_EMAIL_REGEX =  /\A[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}\z/

  validates :password,
            presence: true,
            format: { with: VALID_PASSWORD_REGEX,  message: "must include at least one lowercase letter, one uppercase letter, one digit, and one special character" }

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address" }
end
