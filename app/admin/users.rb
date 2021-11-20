ActiveAdmin.register User do
  permit_params :username

  filter :id
  filter :username
  filter :created_at

  actions :index
end
