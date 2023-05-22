Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :registries 
  resources :coordinators do
    member do
      get :export_participants
    end
    resources :enrollments
  end
  resources :participants
end
