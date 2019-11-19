class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_one_attached :picture, dependent: :destroy

  validates :title, :content, :picture, presence: true,
                                        length: { minimum: 5 }
  #validates :name, presence: true, length: { minimum: 3 }

  # impressionist
  is_impressionable
end
