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

class Comment < ApplicationRecord
  # ancestry gem
  has_ancestry

  belongs_to :post
  belongs_to :author
  has_many :likes, dependent: :destroy
  validates :comment, presence: true
end
