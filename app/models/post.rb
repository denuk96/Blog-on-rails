class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_one_attached :picture, dependent: :destroy

  validates :title, :content , presence: true,
            length: { minimum: 5 }
  validates :name, presence: true,
            length: { minimum: 3 }
end
