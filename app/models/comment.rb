class Comment < ApplicationRecord
  belongs_to :post
  validates :commenter_name, :comment, presence: true,
                                       length: { minimum: 5 }
end
