Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :docs, only: [:index]
    scope :auth do
      post :sign_up, to: 'authentication#sign_up'
      post :sign_in, to: 'authentication#sign_in'
      delete :sign_out, to: 'authentication#sign_out'
    end
    namespace :admin do
      resources :activities, only: %i[create index] do
        member do
          post :schedule
        end
      end
    end

    namespace :user do
      resources :activities, only: %i[index] do
        member do
          post :book
        end
      end
    end
  end
end
