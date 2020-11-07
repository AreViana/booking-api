Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    scope :auth do
      post :sign_up, to: 'authentication#sign_up'
      post :sign_in, to: 'authentication#sign_in'
      delete :sign_out, to: 'authentication#sign_out'
    end
    namespace :admin do
      post :activities, to: 'activities#create'
      get :activities, to: 'activities#index'
    end
  end
end
