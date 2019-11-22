class AddRegToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :email, :string
  end
end
