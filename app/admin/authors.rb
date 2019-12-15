ActiveAdmin.register Author do
  permit_params :first_name, :last_name, :gender, :birthday, :email, :admin, :banned, :email_confirmed
end
