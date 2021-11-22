ActiveAdmin.register User do
  permit_params :username

  filter :id
  filter :username
  filter :created_at

  actions :index, :show, :destroy

  index do 
    column :id
    column :username
    column '# favourited movies' do |r|
      r.favorites.count
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :username
      row '# favourited movies' do |r|
        r.favorites.count
      end
    end
  end
end
