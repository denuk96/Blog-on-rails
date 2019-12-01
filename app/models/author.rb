# == Schema Information
#
# Table name: authors
#
#  id              :bigint           not null, primary key
#  first_name      :string
#  last_name       :string
#  gender          :string
#  birthday        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string
#  password_digest :string
#  admin           :boolean          default(FALSE)
#

class Author < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
