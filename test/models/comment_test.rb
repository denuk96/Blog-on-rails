# == Schema Information
#
# Table name: comments
#
#  id             :bigint           not null, primary key
#  comment        :text
#  post_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :integer
#  ancestry       :string
#  ancestry_depth :integer          default(0)
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
