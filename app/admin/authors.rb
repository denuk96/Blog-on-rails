ActiveAdmin.register Author do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :gender, :birthday, :email, :password_digest, :admin, :banned, :email_confirmed, :confirm_token, :password_reset_sent_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :gender, :birthday, :email, :password_digest, :admin, :banned, :email_confirmed, :confirm_token, :password_reset_sent_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #permit_params do
  #  permitted = [:first_name, :last_name, :gender, :birthday, :email, :login, :banned, :admin]
  #end
end
