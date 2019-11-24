module ApplicationHelper
  # check updated or not
  def updated(sample)
    true if sample.updated_at.to_s != sample.created_at.to_s
  end
end
