EMAIL_REGEX = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i

class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_email
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX, message: "is invalid" }

  private
    def downcase_email
      self.email.downcase!
    end
end
