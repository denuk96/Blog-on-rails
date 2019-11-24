module ApplicationHelper
  # check updated or not
  def updated(sample)
    true if sample.updated_at.to_s != sample.created_at.to_s
  end

  # check comment's owner or admin or not, time limit 1 hour
  def check_comment_rights(current_user,comment)
    true if (current_user.id == comment.author_id && Time.now - comment.created_at < 3600) or current_user.admin == true
  end

end
