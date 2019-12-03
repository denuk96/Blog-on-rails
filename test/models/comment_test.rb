# == Schema Information
#
# Table name: comments
#
#  id             :bigint           not null, primary key
#  comment        :text
#  post_id        :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :bigint
#  ancestry       :string
#  ancestry_depth :integer          default(0)
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
