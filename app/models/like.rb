# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  author_id  :bigint           not null
#  comment_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  value      :integer
#

class Like < ApplicationRecord
  belongs_to :author
  belongs_to :comment

end
