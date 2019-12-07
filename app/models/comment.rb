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

class Comment < ApplicationRecord
  # ancestry gem
  has_ancestry orphan_strategy: :adopt

  belongs_to :post
  belongs_to :author
  has_many :likes, dependent: :destroy
  validates :comment, presence: true
end
