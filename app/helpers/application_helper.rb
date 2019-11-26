module ApplicationHelper
  # check updated or not
  def updated(sample)
    true if sample.updated_at.to_s != sample.created_at.to_s
  end

  # check owner or admin or not, time limit 1 hour
  def check_edit_rights(current_user, sample)
    true if (current_user.id == sample.author_id && Time.now - sample.created_at < 3600) || (current_user.admin == true)
  end

  # count actions
  def pop_up
    true if cookies[:actions] % 5 == 0
  end
end
