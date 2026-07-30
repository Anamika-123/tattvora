class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    enum :role, {
    student: 0,
    teacher: 1,
    admin: 2
  }, default: :student

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :downcase_email

  VALID_PASSWORD_REGEX =  /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z\d\s]).{8,}\z/

  validates :password,
            format: { with: VALID_PASSWORD_REGEX,
                      message: "must include at least one lowercase letter, one uppercase letter, one digit, and one special character"
                    }, allow_nil: true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
