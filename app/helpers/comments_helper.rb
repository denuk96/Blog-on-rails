module CommentsHelper

  # count rating for comments
  def count_rating(sample)
    sample.where(value: 1).count - sample.where(value: -1).count
  end
end
