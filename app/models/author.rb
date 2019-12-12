# == Schema Information
#
# Table name: authors
#
#  id                     :bigint           not null, primary key
#  first_name             :string
#  last_name              :string
#  gender                 :string
#  birthday               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string
#  password_digest        :string
#  admin                  :boolean          default(FALSE)
#  banned                 :boolean          default(FALSE)
#  email_confirmed        :boolean          default(FALSE)
#  confirm_token          :string
#  password_reset_sent_at :datetime
#

class Author < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true,
                       length: { minimum: 8 }, allow_nil: true


  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  # confirm
  before_create :confirmation_token
  after_create :send_confirmation



  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  # confirm
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  def send_confirmation
    AuthorMailer.registration_confirmation(self).deliver!
  end

  # password reset
  def send_password_reset
    confirmation_token
    self.password_reset_sent_at = Time.zone.now
    save!(validate: true)
    AuthorMailer.password_reset(self).deliver!
  end

  # password reset validation

  private

  # token
  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.nil?
  end
end
