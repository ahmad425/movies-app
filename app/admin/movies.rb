ActiveAdmin.register Movie do
  permit_params :name, :year, :director, :main_star, :description, genres: []
  
  filter :id
  filter :name
  filter :year

  actions :all

  form do |f|
    inputs 'Movie' do
      f.input :name
      f.input :year, :as => :select, collection: (1990..2021).map{|y| y}, include_blank: false, include_hidden: false
      f.input :genres, :as => :select, input_html: { multiple: true }, collection: Movie::GENRES, include_blank: false, include_hidden: false
      f.input :director
      f.input :main_star
      f.input :description, :as => :text 
    end
    f.semantic_errors
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :year
      row :genres
      row :director
      row :main_star
      row :description
    end
  end
end
