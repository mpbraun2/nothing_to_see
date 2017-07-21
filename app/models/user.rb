EMAIL_REGEX = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i

class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_email
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX, message: "is invalid" }
  has_many :sold_products, #Products the user has sold to other users
    class_name: 'Product',
    foreign_key: 'from_user_id'
  has_many :bought_products, #products the user has bought from other users
    class_name: 'Product', 
    foreign_key: 'to_user_id'
  has_many :users_bought_from, 
    through: :received_products,
    source: :from_user
  has_many :users_sold_to,
    through: :sent_products,
    source: :to_user 

  private
    def downcase_email
      self.email.downcase!
    end
end
