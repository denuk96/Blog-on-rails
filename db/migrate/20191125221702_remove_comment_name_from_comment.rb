class RemoveCommentNameFromComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :commenter_name
  end
end
