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

require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
