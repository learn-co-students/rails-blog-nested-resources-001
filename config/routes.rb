RailsBlog::Application.routes.draw do

  resources :comments, :only => [:create, :show] do 
    collection do
      post '/:id', to: 'comments#create'
    end
  end

  resources :users
  resources :tags
  resources :posts

end
