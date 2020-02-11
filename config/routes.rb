Rails.application.routes.draw do
  devise_for :users
  get "/", to: "photos#index"
  #get '/photos/:id/download_image', to: 'photos#download_image'
  resources :photos, except: [:index] do
    get "/download_image", to: 'photos#download_image'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
