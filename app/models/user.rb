class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { in: 8..256 }
  validates :password_confirmation, presence: true


  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email(email)
    if user
      user.authenticate(password) or nil
    else
      nil
    end
  end
end
