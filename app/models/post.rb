class Post < ApplicationRecord
  belongs_to :author

  validates :title, :content , presence: true,
            length: { minimum: 5 }
  validates :name, presence: true,
            length: { minimum: 3 }
end
