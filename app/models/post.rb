class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_one_attached :picture, dependent: :destroy
  # do I need this?)
  accepts_nested_attributes_for :comments

  validates :author_id, presence: true
  validates :title, :content, :picture, presence: true,
                                        length: { minimum: 5 }


  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("content LIKE ?", "%#{search}%")
  end

  # impressionist
  is_impressionable
end
