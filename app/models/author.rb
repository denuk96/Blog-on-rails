class Author < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
