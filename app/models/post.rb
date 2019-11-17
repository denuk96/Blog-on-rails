class Post < ApplicationRecord
  belongs_to :author
  AUTHORS_all = Author.all
  has_many :comments, dependent: :destroy

  validates :title, :content , presence: true,
            length: { minimum: 5 }
  validates :name, presence: true,
            length: { minimum: 3 }
end
