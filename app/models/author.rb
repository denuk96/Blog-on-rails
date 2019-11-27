class Author < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
