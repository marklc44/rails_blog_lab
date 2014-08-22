RailsBlogLab::Application.routes.draw do

  root 'posts#index'

  resources :posts do
    resources :tags
    resources :comments
  end
end
