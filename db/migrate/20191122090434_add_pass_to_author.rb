class AddPassToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :password_digest, :string
  end
end
